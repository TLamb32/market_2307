class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.inventory.key?(item)}
  end

  def sorted_item_list
    unique_items = @vendors.flat_map{ |vendor| vendor.inventory.keys }.uniq
    unique_items.map(&:name).sort
  end

  def total_inventory
    total_inventory = Hash.new{ |hash, key| hash[key] = {quantity:0, vendors:[]}}

    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory[item][:quantity] += quantity
      total_inventory[item][:vendors] << vendor
      end
    end
    # require 'pry'; binding.pry
    total_inventory
  end
end