class User < ApplicationRecord
  require 'date'
  require 'securerandom'

  #password_digest 有効
  has_secure_password

  #バリデーション
  validates :name,  presence: true #nameが空でないこと
  validates :email,  presence: true
  validates :password,  presence: true
  validates :name, uniqueness: true #nameがﾕﾆｰｸであること
  validates :password, length: { in: 6..40 } #password6文字以上40字以内

  # google 認証
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      # 元々userモデルにあったｶﾗﾑ
      user.name = auth.info.name # null false
      user.email = auth.info.email # null false
      user.admin = true # null false
      user.created_at = Date.today
      user.updated_at = Date.today
      user.password = SecureRandom.hex(16) #null false だから何か入れてやらないとｴﾗｰに、、、

      #追加したｶﾗﾑ
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      return user
    end

  end

  has_many :messages
  has_many :comments
  #commentsを通してmessagesからたくさんのcomments_messagesを持っている
  has_many :comments_messages, through: :comments, source: :message


end
