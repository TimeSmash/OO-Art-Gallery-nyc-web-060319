# * `Gallery.all`
# Y    * Returns an `array` of all the galleries

# Y  * `Gallery#paintings`   * Returns an `array` of all paintings in a gallery

# Y * `Gallery#artists` * Returns an `array` of all artists that have a painting in a gallery

# Y * `Gallery#artist_names` * Returns an `array` of the names of all artists that have a painting in a gallery

#   * `Gallery#most_expensive_painting` * Returns an `instance` of the most expensive painting in a gallery


class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def new_painting(name, price)
    new_painting = Painting.new(name, price)
    new_painting.gallery = self
    new_painting
  end

  def paintings #all paitings belonging to gallery(self)
    Painting.all.select { |p| p.gallery == self}
  end

  def artists
    #look at all paintings owned, return @artist
    paintings.map {|p| p.artist}.uniq
  end

  def artist_names
    artists.map {|a| a.name}.uniq
  end

  def most_expensive_painting #in gallery(self)
    sorted_prices = painting_prices.sort
    highest_price = sorted_prices[-1]
    paintings.find {|painting| painting.price == highest_price}
  end

  def painting_prices #eturn prices of paintings owned by that gallery (self)
    paintings.map {|p| p.price}
  end

end
