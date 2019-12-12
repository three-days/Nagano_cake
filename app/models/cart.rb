class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :product




# グループメモ
   # def add_product(product)
   #   item = @carts.find {|i| i.product_id == product.id}
   #   if item
   #     item.quantity += 1
   #   else
   #     item = LineItem.for_product(product)
   #     @items << item
   #   end
   #   @total_price += product.price

end
