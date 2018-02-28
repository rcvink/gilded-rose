require_relative '../lib/backstage_pass_updater'
require_relative '../lib/item'

describe BackstagePassUpdater do

  pass_name = 'Backstage passes to a TAFKAL80ETC concert'

  context 'on a pass with quality <= 47,' do

    context 'and sell_in >= 10, changes' do

      before(:each) do
        @pass = Item.new(pass_name, 12, 5)
        backstage_pass_updater = BackstagePassUpdater.new(@pass)
        backstage_pass_updater.update
      end

      it 'quality by +1' do
        expect(@pass.quality).to eq 6
      end

      it 'sell_in by -1' do
        expect(@pass.sell_in).to eq 11
      end

    end

    context 'and 6 <= sell_in < 10, changes' do

      before(:each) do
        @pass = Item.new(pass_name, 6, 10)
        backstage_pass_updater = BackstagePassUpdater.new(@pass)
        backstage_pass_updater.update
      end

      it 'quality by +2' do
        expect(@pass.quality).to eq 12
      end

      it 'sell_in by -1' do
        expect(@pass.sell_in).to eq 5
      end

    end

    context 'and sell_in <= 5, changes' do

      before(:each) do
        @pass = Item.new(pass_name, 3, 20)
        backstage_pass_updater = BackstagePassUpdater.new(@pass)
        backstage_pass_updater.update
      end

      it 'quality by +3' do
        expect(@pass.quality).to eq 23
      end

      it 'sell_in by -1' do
        expect(@pass.sell_in).to eq 2
      end

    end

    context 'and sell_in <= 0, changes' do

      before(:each) do
        @pass = Item.new(pass_name, 0, 4)
        backstage_pass_updater = BackstagePassUpdater.new(@pass)
        backstage_pass_updater.update
      end

      it 'quality to 0' do
        expect(@pass.quality).to eq 0
      end

      it 'sell_in by -1' do
        expect(@pass.sell_in).to eq -1
      end

    end

  end

  context 'on a pass with 48 <= quality < 50' do

    before(:each) do
      @pass = Item.new(pass_name, 3, 49)
      backstage_pass_updater = BackstagePassUpdater.new(@pass)
      backstage_pass_updater.update
    end

    it 'changes quality up to a maximum of 50' do
      expect(@pass.quality).to eq 50
    end

    it 'changes sell_in by -1' do
      expect(@pass.sell_in).to eq 2
    end

  end

  context 'on a pass with quality == 50' do

    before(:each) do
      @pass = Item.new(pass_name, 3, 50)
      backstage_pass_updater = BackstagePassUpdater.new(@pass)
      backstage_pass_updater.update
    end

    it 'does not change quality' do
      expect(@pass.quality).to eq 50
    end

    it 'changes sell_in by -1' do
      expect(@pass.sell_in).to eq 2
    end

  end
end