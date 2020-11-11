require './lib/item'
require './lib/vendor'
require './lib/market'
require 'minitest/autorun'
require 'pry'

class MarketTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @market = Market.new("South Pearl Street Farmers Market")
  end
  def test_it_is
    assert_instance_of Market, @market
  end

  def test_it_has_attr
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal ([]), @market.vendors
  end
end