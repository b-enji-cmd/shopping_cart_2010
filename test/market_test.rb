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
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @market = Market.new("South Pearl Street Farmers Market")
  end
  def test_it_is
    assert_instance_of Market, @market
  end

  def test_it_has_attr
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal ([]), @market.vendors
  end

  def test_it_can_add_vendors
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3.stock(@item1, 65)

    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    assert_equal [@vendor1, @vendor2, @vendor3] , @market.vendors
  end

  def test_it_can_return_vendor_names
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3.stock(@item1, 65)

    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected ,@market.vendor_names
  end

  def test_it_can_return_vendors_who_sell_item
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3.stock(@item1, 65)

    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    assert_equal [@vendor1, @vendor3], @market.vendors_that_sell(@item1)
    assert_equal [@vendor2], @market.vendors_that_sell(@item4)
  end

  def test_it_can_find_all_potential_revenue
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3.stock(@item1, 65)

    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    assert_equal 29.75, @vendor1.potential_revenue
    assert_equal 345.00,@vendor2.potential_revenue
    assert_equal 48.75,@vendor3.potential_revenue
  end

  def test_it_can_total_inventory
    skip
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3.stock(@item1, 65)

    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expected = {
      @item1 => {
        quantity: 100,
        vendors: [@vendor1,@vendor3]
      },
      @item2 => {
          quantity: 7,
          vendors: [@vendor1]
        },
      @item4 => {
          quantity: 50,
          vendors: [@vendor2]
        },
      @item3 => {
          quantity: 35,
          vendors: [@vendor2,@vendor3]
        }
    }

    assert_equal expected, @market.total_inventory
  end

end