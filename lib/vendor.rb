class Vendor
    attr_reader :name,
                :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    if @inventory[item].nil? || @inventory[item] == false
      @inventory[item] = 0
    end
    @inventory[item] += quantity
  end

  def check_stock(item)
    if @inventory[item].nil? || @inventory[item] == false
     @inventory[item] = 0
    end
    @inventory[item]
  end

  def potential_revenue
    @inventory.sum{ |item, quantity| item.price * quantity }
  end
end
