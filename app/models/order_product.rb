class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product
  enum production_status: { notcreate: 0, creating: 1, finished:2 }

end
