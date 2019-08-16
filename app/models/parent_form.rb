class ParentForm < ApplicationRecord
  has_many :users
  has_many :childforms
  has_one_attached :image
end
