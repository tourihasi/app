class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  # active strage 複数upload
  has_many_attached :images
end
