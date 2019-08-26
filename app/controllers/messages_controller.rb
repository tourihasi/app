class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
    @user = @message.user # messageを作成したuser
    @comment = Comment.new
    # Commentからmessage_idが@messageのﾃﾞｰﾀを日付の降順
    @comments = Comment.where(message_id: @message).order('created_at DESC')
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      redirect_to message_path(@message.id)
    else
      render :new
    end
  end

  def index
    @search_messages = Message.order("created_at DESC").ransack(params[:q])
    @messages = @search_messages.result(distinct: true).page(params[:page]).per(8)

    @search_star_messages = current_user.star_messages.order("created_at DESC").ransack(params[:q])
    @star_messages = @search_star_messages.result(distinct: true).page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.csv { send_data @messages.generate_csv, filename: "メッセージ#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def index_sent
    @search_messages = Message.where(user_id: current_user.id).order("created_at DESC").ransack(params[:q])
    @messages = @search_messages.result(distinct: true).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.csv { send_data @messages.generate_csv, filename: "メッセージ#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])

    if message.update(message_params)
      redirect_to message_path
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    head :no_content
  end

  private # images: [] => ﾌｧｲﾙ複数収納

  def message_params
    params.require(:message).permit(:title, :body, images: [])
  end
end
