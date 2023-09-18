require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  before(:each) do
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom") 
    @vendor3 = Vendor.new("Palisade Peach Shack") 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @market = Market.new("South Pearl Street Farmers Market")
  end
  
  describe '#initialize' do 
    it 'exists' do 
      expect(@market).to be_an_instance_of(Market)
      expect(@vendor2).to be_an_instance_of(Vendor)
      expect(@vendor3).to be_an_instance_of(Vendor)
    end
  end

  describe '#market name and vendors' do 
    it 'shows market name and vendors' do 
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors).to eq([])
    end
  end

  describe '#stock items' do 
    it 'stocks items to vendors' do 
      @vendor1.stock(@item1, 35) 
      @vendor1.stock(@item2, 7) 
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
    end
  end

  describe '#add vendors to markets' do 
    it 'add vendors to markets' do 
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do 
    it 'finds the vendors that sell an item' do 
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      @vendor1.stock(@item1, 35) 
      @vendor1.stock(@item2, 7) 
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    end
  end
end