class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  CATEGORIES = ['painting', 'drawing', 'digital painting', 'photography']
  validates_inclusion_of :category, :in => CATEGORIES
end
