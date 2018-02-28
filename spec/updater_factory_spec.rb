require_relative '../lib/updater_factory'
require_relative '../lib/item'

describe UpdaterFactory do

  updater_factory = UpdaterFactory.new
  brie = Item.new('Aged Brie', 3, 5)
  sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 5, 40)
  pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 20)
  regular = Item.new('Reggie', 4, 6)

  it 'returns a BrieUpdater' do
    expect(updater_factory.create(brie)).to be_instance_of BrieUpdater
  end

  it 'returns a SulfurasUpdater' do
    expect(updater_factory.create(sulfuras)).to be_instance_of SulfurasUpdater
  end

  it 'returns a BackstagePassUpdater' do
    expect(updater_factory.create(pass)).to be_instance_of BackstagePassUpdater
  end

  it 'returns a RegularUpdater' do
    expect(updater_factory.create(regular)).to be_instance_of RegularUpdater
  end

end