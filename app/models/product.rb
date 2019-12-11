class Product < ApplicationRecord

	has_many :carts
	has_many :users, through: :carts

  has_many :order_products, dependent: :destroy

  belongs_to :genre
  attachment :image
  # 販売ステータスをあてがうための変更です。
  enum sale_status: { sales: 0, stopped: 1 }

end
