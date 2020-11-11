require './lib/item'
require 'minitest/autorun'
require 'pry'

class ItemTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
  end

  def test_it_is
    assert_instance_of Item, @item1
  end

  def test_it_has_attributes
    assert_equal "Peach", @item1.name
    assert_equal 0.75, @item1.price
  end
end