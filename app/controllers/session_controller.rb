class SessionController < ApplicationController
  skip_before_action :login_required

  def new; end

  def create
    # user = nil
    user = User.find_by(name: session_params[:name])
    # binding.pry
    if user&.authenticate(session_params[:password]) # authenticate = 暗号化されてないパスワードとpassword_digest属性値の一致を検証
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  # google認証
  def create_g
    user = User.from_omniauth(request.env["omniauth.auth"])
    # binding.pry
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
