class StarsController < ApplicationController
  def create
    star = current_user.stars.build(message_id: params[:message_id])
    star.save
    redirect_to messages_path
  end

  def destroy
    url = request.referer
    star = Star.find_by(message_id: params[:message_id], user_id: current_user.id)
    star.destroy
    if url.match('messages')
      redirect_to messages_path
    else
      redirect_to root_path
    end
  end
end
