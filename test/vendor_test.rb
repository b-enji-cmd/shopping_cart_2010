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

end