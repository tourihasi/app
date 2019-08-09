class MessageMailer < ApplicationMailer
  default from: 'sousinngawa@example.com' #送信者は毎回共通にしたいため設定

  def creation_email(message)
    @message = message
    mail (
      subject: 'テストメール'
      to: 'example@.com'
    )
  end
end
