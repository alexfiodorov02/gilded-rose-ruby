class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    case name
    when 'normal'
      normal_tick
    when 'Aged Brie'
      brie_tick
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_passes_tick
    when 'Sulfuras, Hand of Ragnaros'
      sulfuras_tick
    end
  end

  private

  def sulfras_tick
      # Sulfuras doesn't change in quality or sell_in
    end
  end

  def brie_tick
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining <= 0
  end

  def normal_tick
    @days_remaining -= 1
    return if @quality == 0

    @quality -=1
    @quality -=1 if @days_remaining <= 0
  end

  def backstage_passes_tick
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining < 11
    @quality += 1 if @days_remaining < 6
    @quality = 0 if @days_remaining < 0
  end
end
