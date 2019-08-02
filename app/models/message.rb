class Message < ApplicationRecord
  #userとmessageの1対多の関係
  belongs_to :user
  has_many :comments 
  #messageはcommentsを通して多くのuserを持っている
  has_many :comment_users, through: :comments, source: :user
  # active strage 複数upload
  has_many_attached :images
end
