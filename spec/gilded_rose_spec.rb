require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  item = Item.new('Test item', 4, 9)

  let(:updater) { double :updater, update: nil }
  let(:updater_factory) { double :updater_factory, create: updater }

  before(:each) do
    gilded_rose = GildedRose.new([item], updater_factory)
    gilded_rose.update_quality
  end

  it 'calls #create on its UpdaterFactory' do
    expect(updater_factory).to have_received(:create).with(item)
  end

  it 'calls #update on the return of UpdaterFactory' do
    expect(updater).to have_received(:update)
  end

end
