class SessionController < ApplicationController
  skip_before_action :login_required

  def new; end

  def create
    if params[:commit] != "サインイン"
      session[:user_id] = 162
      redirect_to root_path
    else
      user = User.find_by(name: session_params[:name])
      if user&.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render :new
      end
    end
  end

  # google認証
  def create_g
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
