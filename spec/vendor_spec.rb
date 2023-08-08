require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  describe "initialize" do
    it "exists and has readable attributes" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
      expect(vendor.check_stock(item1)).to eq(0)

    end
  end
  
  describe "#stock" do
    it "can add items to its inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      vendor.stock(item1, 30)
      expect(vendor.inventory).to eq({item1 => 30})
      expect(vendor.check_stock(item1)).to eq(30)
      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)
      vendor.stock(item2, 12)
      expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
    end
  end
  
  describe "#potential_revenue" do
    it "can determine potential revenue for each vendor" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$1.00"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      vendor.stock(item1, 25)
      vendor.stock(item2, 10)

      expect(vendor.potential_revenue).to eq(30)
    end
  end
end