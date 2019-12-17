class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products, dependent: :destroy
  # has_many :products, through: :order_products
  enum order_status: { notpay: 0, paid: 1, shipped: 2 }
  enum payment_method: { cash: 0, card: 1 }

end
