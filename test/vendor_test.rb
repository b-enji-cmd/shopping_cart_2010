require './lib/item'
require './lib/vendor'
require 'minitest/autorun'
require 'pry'

class VendorTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_is
    assert_instance_of Vendor, @vendor
  end

  def test_attr
    expected = {}
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end
  
  def test_it_can_stock
    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end
end