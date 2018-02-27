require_relative '../lib/gilded_rose'

describe GildedRose do

  describe '#update_quality' do

    context 'on a normal item, changes its' do

      before(:each) do
        @normal_item = Item.new('normie', 10, 20)
        gilded_rose = GildedRose.new([@normal_item])
        gilded_rose.update_quality
      end

      it 'quality by -1' do
        expect(@normal_item.quality).to eq 19
      end

      it 'sell_in by -1' do
        expect(@normal_item.sell_in).to eq 9
      end

    end

    context 'on a brie, changes its' do

      before(:each) do
        @brie = Item.new('Aged Brie', 2, 0)
        gilded_rose = GildedRose.new([@brie])
        gilded_rose.update_quality
      end

      it 'quality by +1' do
        expect(@brie.quality).to eq 1
      end

      it 'sell_in by -1' do
        expect(@brie.quality).to eq 1
      end

    end

    context 'on a sulfuras, does not change its' do

      before(:each) do
        @sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 0)
        gilded_rose = GildedRose.new([@sulfuras])
        gilded_rose.update_quality
      end

      it 'quality' do
        expect(@sulfuras.quality).to eq 0
      end

      it 'sell_in' do
        expect(@sulfuras.sell_in).to eq 0
      end

    end

    context 'on a backstage pass,' do

      context 'when the concert is >10 days away, changes its' do

        before(:each) do
          @backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 5)
          gilded_rose = GildedRose.new([@backstage_pass])
          gilded_rose.update_quality
        end

        it 'quality by +1' do
          expect(@backstage_pass.quality).to eq 6
        end

        it 'sell_in by -1' do
          expect(@backstage_pass.sell_in).to eq 11
        end

      end

      context 'when the concert is 6-10 days away, changes its' do

        before(:each) do
          @backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 5)
          gilded_rose = GildedRose.new([@backstage_pass])
          gilded_rose.update_quality
        end

        it 'quality by +2' do
          expect(@backstage_pass.quality).to eq 7
        end

        it 'sell_in by -1' do
          expect(@backstage_pass.sell_in).to eq 7
        end

      end

      context 'when the concert is =<5 days away, changes its' do

        before(:each) do
          @backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 5)
          gilded_rose = GildedRose.new([@backstage_pass])
          gilded_rose.update_quality
        end

        it 'quality by +3' do
          expect(@backstage_pass.quality).to eq 8
        end

        it 'sell_in by -1' do
          expect(@backstage_pass.sell_in).to eq 4
        end

      end

    end

  end

end
