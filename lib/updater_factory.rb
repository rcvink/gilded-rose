require 'brie_updater'
require 'sulfuras_updater'
require 'backstage_pass_updater'
require 'regular_updater'

class UpdaterFactory

  def create(item)
    case item.name
    when 'Aged Brie'
      BrieUpdater.new(item)
    when 'Sulfuras, Hand of Ragnaros'
      SulfurasUpdater.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePassUpdater.new(item)
    else
      RegularUpdater.new(item)
    end
  end
end