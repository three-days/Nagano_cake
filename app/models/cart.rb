class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :product





  def total_price
    cart.product.tax_excluded * cart.product_number
  end

end
