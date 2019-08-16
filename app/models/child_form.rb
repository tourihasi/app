class ChildForm < ApplicationRecord
  belongs_to :user
  belongs_to :parentform
  has_one_attached :image
end
