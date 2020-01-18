class CashRegister
  attr_accessor :discount, :total, :quantity, :totals
  
  @@items = []
  
  def initialize(discount=0) #makes disount optional
    @total = 0 
    @discount = discount
    @totals = []
  end
  
  def add_item(title, price, quantity=1)
    self.total += price * quantity
    
    while quantity > 0 
      @@items << title
      quantity -= 1
    end
    
    @totals << @total
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
  
  def items
    @items  
  end
  
  def void_last_transaction
    @totals.pop
    if @totals.empty?
      @total= 0.0 
    else
      @total = @totals.last
    end
  end 

end  






