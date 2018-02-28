require_relative '../lib/brie_updater'
require_relative '../lib/item'

describe BrieUpdater do

  context 'on a brie with quality < 50' do

    context 'before sell by date, changes' do

      before(:each) do
        @brie = Item.new('Aged Brie', 2, 0)
        brie_updater = BrieUpdater.new(@brie)
        brie_updater.update
      end

      it 'quality by +1' do
        expect(@brie.quality).to eq 1
      end

      it 'sell_in by -1' do
        expect(@brie.sell_in).to eq 1
      end

    end

    context 'after sell by date, changes' do

      before(:each) do
        @brie = Item.new('Aged Brie', 0, 0)
        brie_updater = BrieUpdater.new(@brie)
        brie_updater.update
      end

      it 'quality by +2' do
        expect(@brie.quality).to eq 2
      end

      it 'sell_in by -1' do
        expect(@brie.sell_in).to eq -1
      end

    end

  end

  context 'on a brie with quality >= 50' do

    before(:each) do
      @brie = Item.new('Aged Brie', 3, 50)
      brie_updater = BrieUpdater.new(@brie)
      brie_updater.update
    end

    it 'does not change quality' do
      expect(@brie.quality).to eq 50
    end

    it 'changes sell_in by -1' do
      expect(@brie.sell_in).to eq 2
    end

  end

end