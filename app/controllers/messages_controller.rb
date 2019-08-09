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
      MessageMailer.creation_email(@message).deliver_now # deliver_now = 即時送信
      redirect_to message_path(@message.id)
    else
      render :new
    end
  end

  def index
    # ranssackで検索
    @search_messages = Message.order("created_at DESC").ransack(params[:q])
    # kaminariでﾍﾟｰｼﾞﾈｰｼｮﾝ
    @messages = @search_messages.result(distinct: true).page(params[:page]).per(10)

    respond_to do |format| # viewから送られてくるフォーマットで処理を分岐させる
      format.html  # fomatが htmlなら ...なにもしない
      # fomatがcsvならsend_dataメソッドでデータを送り、@messageデータを  generate_csv(modelに定義した関数)してcsvファイルとして返す
      format.csv { send_data @messages.generate_csv, filename: "メッセージ#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def index_sent # current_userが展開したメッセージだけ表示
    # binding.pry
    # ranssackで検索
    @search_messages = Message.where(user_id: current_user.id).order("created_at DESC").ransack(params[:q])
    # kaminariでﾍﾟｰｼﾞﾈｰｼｮﾝ
    @messages = @search_messages.result(distinct: true).page(params[:page]).per(10)

    respond_to do |format| # viewから送られてくるフォーマットで処理を分岐させる
      format.html  # fomatが htmlなら ...なにもしない
      # fomatがcsvならsend_dataメソッドでデータを送り、@messageデータを  generate_csv(modelに定義した関数)してcsvファイルとして返す
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
    # message.jsにAJAX処理記載しています
    # headメソッドを用いて、ﾚｽﾎﾟﾝｽﾎﾞﾃﾞｨなしで、HTTPｽﾃｰﾀｽ204(成功)が返るようにしておく
    # なくても動作するが、分かりやすさの為記述
  end

  private # images: [] => ﾌｧｲﾙ複数収納

  def message_params
    params.require(:message).permit(:title, :body, images: [])
  end
end
