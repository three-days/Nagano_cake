class Delivery < ApplicationRecord
	belongs_to :user

  validates :delivery_address, presence: true
  validates :delivery_name, presence: true
  validates :delivery_postal_code, presence: true


end
