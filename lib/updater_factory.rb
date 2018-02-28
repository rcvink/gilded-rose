require_relative 'brie_updater'
require_relative 'sulfuras_updater'
require_relative 'backstage_pass_updater'
require_relative 'conjured_updater'
require_relative 'regular_updater'

class UpdaterFactory

  def create(item)
    if item.name == 'Aged Brie'
      BrieUpdater.new(item)
    elsif item.name == 'Sulfuras, Hand of Ragnaros'
      SulfurasUpdater.new(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePassUpdater.new(item)
    elsif item.name.include? 'Conjured'
      ConjuredUpdater.new(item)
    else
      RegularUpdater.new(item)
    end
  end
end