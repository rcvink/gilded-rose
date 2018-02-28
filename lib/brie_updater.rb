class BrieUpdater

  def initialize(brie)
    @brie = brie
  end

  def update
    unless max_quality?
      if past_sell_by?
        increment_quality_by(2)
      else
        increment_quality_by(1)
      end
    end
    decrement_sell_in
  end

  private

  def max_quality?
    @brie.quality >= 50
  end

  def past_sell_by?
    @brie.sell_in <= 0
  end

  def decrement_sell_in
    @brie.sell_in -= 1
  end

  def increment_quality_by(amount)
    @brie.quality += amount
  end

end