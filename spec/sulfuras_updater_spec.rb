require_relative '../lib/gilded_rose'
require_relative '../lib/sulfuras_updater'

describe SulfurasUpdater do

  before(:each) do
    @sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 5, 40)
    sulfuras_updater = SulfurasUpdater.new(@sulfuras)
    sulfuras_updater.update
  end

  it 'does not change quality' do
    expect(@sulfuras.quality).to eq 40
  end

  it 'does not change sell_in' do
    expect(@sulfuras.sell_in).to eq 5
  end

end