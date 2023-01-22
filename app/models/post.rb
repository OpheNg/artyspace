class Post < ApplicationRecord
  has_one_attached :photo

  CATEGORIES = ['painting', 'drawing', 'digital painting', 'photography']
  validates_inclusion_of :category, :in => CATEGORIES
end
