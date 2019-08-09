class Message < ApplicationRecord
  # userとmessageの1対多の関係
  belongs_to :user
  has_many :comments
  # messageはcommentsを通して多くのuserを持っている
  has_many :comment_users, through: :comments, source: :user
  # active strage 複数upload
  has_many_attached :images

  # ﾍﾟｰｼﾞ前後送り
  def previous
    Message.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Message.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end