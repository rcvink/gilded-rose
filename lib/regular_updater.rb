class RegularUpdater

  def initialize(item)
    @item = item
  end

  def update
    unless min_quality?
      if past_sell_by?
        decrement_quality_by(2)
      else
        decrement_quality_by(1)
      end
    end
    decrement_sell_in
  end

  private

  def min_quality?
    return @item.quality <= 0
  end

  def past_sell_by?
    return @item.sell_in <= 0
  end

  def decrement_quality_by(amount)
    @item.quality -= amount
  end

  def decrement_sell_in
    @item.sell_in -= 1
  end

end