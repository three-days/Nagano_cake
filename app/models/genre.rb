class Genre < ApplicationRecord
  has_many :products
  acts_as_paranoid

  validates :genre_name, presence: true

end
