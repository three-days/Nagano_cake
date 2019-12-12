class Order < ApplicationRecord


  belongs_to :user
  has_many :order_products, dependent: :destroy
  belongs_to :top
  enum order_status: { notpay: 0, paid: 1, shipped: 2 }

end
