class Art < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  CATEGORIES = ['painting', 'drawing', 'digital painting', 'photography']
  validates_inclusion_of :category, :in => CATEGORIES
end
