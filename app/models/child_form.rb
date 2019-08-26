class ChildForm < ApplicationRecord
  belongs_to :user
  belongs_to :parent_form
  has_one_attached :image

  validate :image_attached?
  validate :image_size

  private

  def image_attached?
    errors.add(:images, 'ファイルを添付してください。') unless image.attached?
  end

  def image_size
    if image.attached?
      errors.add(:images, '5メガバイト以上は添付できません。') if image.blob.byte_size > 5.megabytes
    end
  end
end
