class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
end
