class Genre < ApplicationRecord
  has_many :products
  acts_as_paranoid
end
