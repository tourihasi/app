class User < ApplicationRecord
  #password_digest 有効
  has_secure_password

  #バリデーション
  validates :name,  presence: true #nameが空でないこと
  validates :email,  presence: true
  validates :password,  presence: true
  validates :name, uniqueness: true #nameがﾕﾆｰｸであること
  validates :password, length: { in: 6..40 } #password6文字以上40字以内
end
