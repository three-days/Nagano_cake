class OrderProduct < ApplicationRecord
  belongs_to :order
  validates_presence_of :order
  belongs_to :product
  enum production_status: { notcreate: 0, creating: 1, finished:2 }

end
