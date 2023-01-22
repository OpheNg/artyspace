class Art < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  CATEGORIES = ['painting', 'drawing', 'digital painting', 'photography']
  validates_inclusion_of :category, :in => CATEGORIES

  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

end
