module ProductsHelper

def addTax(money,rate)
  taxed_money = (money*rate).round
   "#{taxed_money}"
end

end
