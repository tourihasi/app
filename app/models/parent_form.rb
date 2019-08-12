class ParentForm < ApplicationRecord
  has_many :users
  has_many :childforms
end
