class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new{|h,k| h[k] = 0}
  end

  def check_stock(arg_item)
    @inventory[arg_item]
  end

  def stock(arg_item, amount)
    @inventory[arg_item] += amount
  end

  def potential_revenue
    running_revenue = 0.0
    @inventory.each do |item,amount|
      running_revenue += item.price * amount
    end
    running_revenue
  end
end