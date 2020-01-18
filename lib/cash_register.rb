class CashRegister
  attr_accessor :discount, :total, :quantity, :totals, :items
  
  
  def initialize(discount=0) #makes disount optional
    @total = 0 
    @discount = discount
    @items = []
    @totals = []
  end
  
  def add_item(title, price, quantity=1)
    self.total += price * quantity #doesn't forget about previous total 
    
    while quantity > 0 
      self.items << title
      quantity -= 1
    end
    
    self.totals << self.total
  end
  
  def apply_discount 
    if self.discount == 0
      return "There is no discount to apply."
    else
        self.total = self.total - (self.total * (self.discount/100.0))
        self.total = self.total.to_i
    return "After the discount, the total comes to $#{self.total}."
    end
  end
  
  
  def void_last_transaction
    self.totals.pop
    if self.totals.empty?
      self.total= 0.0 
    else
      self.total = self.assert_not_equal.last
    end
  end 

end  






