class StarsController < ApplicationController
  def create
    star = current_user.stars.build(message_id: params[:message_id])
    star.save
    redirect_to messages_path
  end

  def destroy
    star = Star.find_by(message_id: params[:message_id], user_id: current_user.id)
    star.destroy
    redirect_to messages_path
  end
end
