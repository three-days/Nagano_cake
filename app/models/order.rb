class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
end
