class Product < ApplicationRecord
  belongs_to :genre
  attachment :image
  # 販売ステータスをあてがうための変更です。
  enum sale_status: { sales: 0, stopped: 1 }
end
