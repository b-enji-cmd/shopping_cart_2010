class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new{|h,k| h[k] = 0}
  end

  def check_stock(arg_item)
    @inventory[arg_item]
  end
end