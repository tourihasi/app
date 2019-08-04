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
    # @messageのuser_idはサインイン中のuserのid
    @message.user_id = current_user.id

    if @message.save
      redirect_to message_path(@message.id)
    else
      render :new
    end
  end

  def index
    # ranssackで検索
    @search_messages = Message.ransack(params[:q])
    # kaminariでﾍﾟｰｼﾞﾈｰｼｮﾝ
    @messages = @search_messages.result(distinct: true).page(params[:page]).per(10)
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
    # message.jsにAJAX処理記載しています
    # headメソッドを用いて、ﾚｽﾎﾟﾝｽﾎﾞﾃﾞｨなしで、HTTPｽﾃｰﾀｽ204(成功)が返るようにしておく
    # なくても動作するが、分かりやすさの為記述
  end

  private # images: [] => ﾌｧｲﾙ複数収納

  def message_params
    params.require(:message).permit(:title, :body, images: [])
  end
end
