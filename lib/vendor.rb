class Vendor
    attr_reader :name,
                :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    @inventory[item] = @inventory[item] + quantity
    if @inventory[item].nil? || @inventory[item] == false
      @inventory[item] = 0
    end
  end

  def check_stock(item)
    @inventory[item]
     if @inventory[item].nil? || @inventory[item] == false
      @inventory[item] = 0
     end
  end
end
