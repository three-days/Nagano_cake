class Delivery < ApplicationRecord
	belongs_to :user

  validates :delivery_address, presence: true
  validates :delivery_name, presence: true
  validates :delivery_postal_code, presence: true


  def deli_postal_address_and_name
    '〒' + self.delivery_postal_code + ' ' + self.delivery_address + ' ' + self.delivery_name
  end
end
