require_relative '../lib/regular_updater'
require_relative '../lib/item'

describe RegularUpdater do

  context 'on an item with quality > 0,' do

    context 'before sell by date, changes' do

      before(:each) do
        @item = Item.new('regular', 5, 10)
        regular_updater = RegularUpdater.new(@item)
        regular_updater.update
      end

      it 'quality by -1' do
        expect(@item.quality).to eq 9
      end

      it 'sell_in by -1' do
        expect(@item.sell_in).to eq 4
      end

    end

    context 'after sell by date, changes' do

      before(:each) do
        @item = Item.new('regular', 0, 20)
        regular_updater = RegularUpdater.new(@item)
        regular_updater.update
      end

      it 'quality by -2' do
        expect(@item.quality).to eq 18
      end

      it 'sell_in by -1' do
        expect(@item.sell_in).to eq -1
      end

    end

  end

  context 'on an item with quality == 0,' do

    before(:each) do
      @item = Item.new('regular', 5, 0)
      regular_updater = RegularUpdater.new(@item)
      regular_updater.update
    end

    it 'does not change quality' do
      expect(@item.quality).to eq 0
    end

    it 'changes sell_in by -1' do
      expect(@item.sell_in).to eq 4
    end

  end

end