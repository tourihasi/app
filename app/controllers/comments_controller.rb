class CommentsController < ApplicationController
  def new
  end

  def create
    comment = Comment.new(comment_params)
    #message showに渡す↓
    @comments = Comment.where(message_id: params[:message_id]).order("created_at DESC")
  
    #ajax
    respond_to do |format|
      if comment.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    #message showに渡す↓
    @comments = Comment.where(message_id: params[:message_id]).order("created_at DESC")

    respond_to do |format|
      if @comment.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :content, :message_id, :user_id, images: [])
  end
end
