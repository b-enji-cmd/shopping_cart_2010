class Market
  attr_reader :name, :vendors
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

  def vendors_that_sell(arg_item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(arg_item)
    end
  end

  def total_inventory
    breakdown = Hash.new{|h,k| h[k] = {quantity:0,vendors:[]}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item,quantity|
        breakdown[item][:quantity]+=quantity
        breakdown[item][:vendors]<<vendors_that_sell(item)
      end
    end
  end
end
