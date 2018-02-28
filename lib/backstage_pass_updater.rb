class BackstagePassUpdater

  def initialize(backstage_pass)
    @backstage_pass = backstage_pass
  end

  def update
    if concert_passed?
      @backstage_pass.quality = 0
    elsif concert_1_to_5_days_away?
      increment_quality_by(3)
    elsif concert_6_to_10_days_away?
      increment_quality_by(2)
    elsif concert_11_or_more_days_away?
      increment_quality_by(1)
    end
    @backstage_pass.sell_in -= 1
  end

  private

  def concert_passed?
    @backstage_pass.sell_in <= 0
  end

  def concert_1_to_5_days_away?
    (1..5).cover? @backstage_pass.sell_in
  end

  def concert_6_to_10_days_away?
    (6..10).cover? @backstage_pass.sell_in
  end

  def concert_11_or_more_days_away?
    @backstage_pass.sell_in >= 11
  end

  def increment_quality_by(amount)
    max_quality_would_be_exceeded?(amount) ? set_quality_to_max : @backstage_pass.quality += amount
  end

  def max_quality_would_be_exceeded?(amount)
    @backstage_pass.quality + amount > 50
  end

  def set_quality_to_max
    @backstage_pass.quality = 50
  end

end