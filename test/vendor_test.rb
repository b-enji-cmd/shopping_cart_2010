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
    expected = {
      @item1 => 30
    }
    @vendor.stock(@item1, 30)
    assert_equal expected, @vendor.inventory
    assert_equal 30, @vendor.check_stock(@item1)
  end

  def test_it_can_increment_stock
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)

    assert_equal 55, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_multiple_items
    expected = {
      @item1 => 55,
      @item2 => 12
    }

    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)

    @vendor.stock(@item2, 12)
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_generate_potential_revenue
    expected = {
        @item1 => 55,
        @item2 => 12
    }

    @vendor.stock(@item1, 55)#0.75 per -> 41.25
    @vendor.stock(@item2, 12)#0.55 per - > 6.6
    #should be 47.85
    assert_equal 47.85, @vendor.potential_revenue

  end
end