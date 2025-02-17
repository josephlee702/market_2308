class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if inventory[item] == nil
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    @inventory[item] == nil ? @inventory[item] = quantity: @inventory[item] += quantity
  end
end
