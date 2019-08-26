class ParentForm < ApplicationRecord
  belongs_to :user
  has_many :child_forms ,dependent: :destroy
  has_one_attached :image

  validate :image_attached?
  validate :image_size
  
  private  
  def image_attached?
    if !image.attached?
      errors.add(:images, 'ファイルを添付してください。')
    end
  end

  def image_size
    if image.attached?
      if image.blob.byte_size > 5.megabytes
        errors.add(:images, '10メガバイト以上は添付できません。')
      end
    end
  end
end
