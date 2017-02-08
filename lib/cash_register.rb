require 'pry'



class CashRegister
  attr_accessor :items
  attr_accessor :total
  attr_accessor :last_transaction
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  # def total=(new_total)
  #   @total = new_total
  # end
  #
  # def total
  #   @total
  # end

  def add_item(item, price, number = 1)
    @total += price * number
    @last_transaction = price
    while number > 0
      @items << item
      number -= 1
    end
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0
    @total = @total * ((100 - self.discount.to_f)/100)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
