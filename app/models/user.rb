class User < ApplicationRecord
  #password_digest 有効
  has_secure_password
end
