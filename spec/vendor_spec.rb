require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do 
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  
  describe '#initialize' do 
    it 'exists' do 
      expect(@vendor).to be_an_instance_of(Vendor)
    end
  end

  describe '#vendor name and inventory' do 
    it 'shows vendors name and inventory' do 
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})      
    end
  end

  describe '#check_stock' do 
    it 'checks item stock' do 
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe '#stock' do 
    it 'adds stock to item' do 
      expect(@vendor.check_stock(@item1)).to eq(0)
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq(@item1 => 30)
    end
  end
end