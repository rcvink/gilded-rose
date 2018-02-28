require_relative '../lib/conjured_updater'
require_relative '../lib/item'

describe ConjuredUpdater do

  context 'on an item with quality > 0,' do

    context 'before sell by date, changes' do

      before(:each) do
        @item = Item.new('Conjured Mana Cake', 5, 10)
        conjured_updater = ConjuredUpdater.new(@item)
        conjured_updater.update
      end

      it 'quality by -2' do
        expect(@item.quality).to eq 8
      end

      it 'sell_in by -1' do
        expect(@item.sell_in).to eq 4
      end

    end

    context 'after sell by date, changes' do

      before(:each) do
        @item = Item.new('Conjured Mana Cake', 0, 20)
        conjured_updater = ConjuredUpdater.new(@item)
        conjured_updater.update
      end

      it 'quality by -4' do
        expect(@item.quality).to eq 16
      end

      it 'sell_in by -1' do
        expect(@item.sell_in).to eq -1
      end

    end

  end

  context 'on an item with quality == 0,' do

    before(:each) do
      @item = Item.new('Conjured Mana Cake', 6, 0)
      conjured_updater = ConjuredUpdater.new(@item)
      conjured_updater.update
    end

    it 'does not change quality' do
      expect(@item.quality).to eq 0
    end

    it 'changes sell_in by -1' do
      expect(@item.sell_in).to eq 5
    end

  end

end