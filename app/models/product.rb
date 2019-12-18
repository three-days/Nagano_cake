class Product < ApplicationRecord

	has_many :carts
	has_many :users
  has_many :order_products, dependent: :destroy
  belongs_to :genre
  attachment :image
  # 販売ステータスをあてがうための変更です。
  enum sale_status: { sales: 0, stopped: 1 }

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :tax_excluded, presence: true

# 検索フォーム用の記述。
    def self.search(search)
      if search
        where(['product_name LIKE ?', "%#{search}%"])
      else
        all
      end
    end
end
