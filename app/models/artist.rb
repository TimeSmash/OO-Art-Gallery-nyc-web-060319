# **ARTIST**

# Y  * `Artist.all`   * Returns an `array` of all the artists YES

# Y * `Artist#paintings` * Returns an `array` all the paintings by an artist YES

# Y  * `Artist#galleries` * Returns an `array` of all the galleries that an artist has paintings in

# Y * `Artist#cities` * Return an `array` of all cities that an artist has paintings in

#  Y  * `Artist.total_experience` * Returns an `integer` that is the total years of experience of all artists

# Y  * `Artist.most_prolific` * Returns an `instance` of the artist with the highest amount of paintings per year of experience.

# Y  * `Artist#create_painting` * Given arguments of `title`, `price` and `gallery`, creates new painting of artist
require 'pry'
class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.total_experience #an amount
    exp_arr = self.all.map { |artist| artist.years_experience}     #Make arr of all artist's @years values (bcoms arr of #s)
    exp_arr.reduce(:+)
  end

  # N  * `Artist.most_prolific` * Returns an `instance` of the artist with the highest amount of paintings per year of experience.
  def self.most_prolific
    all_paintings_per_year = self.all.map { |p| p.paintings_per_year}
    highest_paintings_per_year = all_paintings_per_year.sort.last
    Artist.all.find {|a| a.paintings_per_year == highest_paintings_per_year}
  end

  def paintings #Array of P_objs whose @artist == self
    Painting.all.select {|painting| painting.artist == self}
  end

  def total_painting_amount
    paintings.length
  end

  def paintings_per_year
    ((self.total_painting_amount.to_f) / (self.years_experience.to_f)).round(2)
  end

  def create_painting(title, price)
    new_painting = Painting.new(title, price)
    new_painting.artist = self
    new_painting
  end

  def galleries #Returns all galleries that artist has paitnings in 
    paintings.map {|artist_painting| artist_painting.gallery}.uniq #Srch paintings, return @gallery vals
  end

  # N * `Artist#cities` * Return an `array` of all cities that an artist has paintings in
  def cities 
    galleries.map{|g| g.city}.uniq
  end


end


