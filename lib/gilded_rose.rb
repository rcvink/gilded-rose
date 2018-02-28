require_relative 'updater_factory'

class GildedRose

  def initialize(items, updater_factory = UpdaterFactory.new)
    @items = items
    @updater_factory = updater_factory
  end

  def update_quality
    @items.each do |item|
      @updater_factory.create(item).update
    end
  end

end

