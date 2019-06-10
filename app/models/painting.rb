# **PAINTING**

# Y   * `Painting.all`     * Returns an `array` of all the paintings

# Y   * `Painting.total_price` * Returns an `integer` that is the total price of all paintings
class Painting

  attr_reader :title, :price

  attr_accessor :artist, :gallery

  @@all = []

  def initialize(title, price)
    @title = title
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.total_price
    self.all_prices.sum
  end

  def self.all_prices
    self.all.map{|painting| painting.price}
  end

end
