require 'updater_factory'

class GildedRose

  def initialize(items)
    @items = items
    @updater_factory = UpdaterFactory.new
  end

  def update_quality()
    @items.each do |item|
      @updater_factory.create(item).update
    end
  end

end

