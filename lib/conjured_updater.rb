class ConjuredUpdater

  def initialize(conjured_item)
    @conjured_item = conjured_item
  end

  def update
    unless min_quality?
      if past_sell_by?
        decrement_quality_by(4)
      else
        decrement_quality_by(2)
      end
    end
    decrement_sell_in
  end

  private

  def min_quality?
    @conjured_item.quality <= 0
  end

  def past_sell_by?
    @conjured_item.sell_in <= 0
  end

  def decrement_quality_by(amount)
    @conjured_item.quality -= amount
  end

  def decrement_sell_in
    @conjured_item.sell_in -= 1
  end

end