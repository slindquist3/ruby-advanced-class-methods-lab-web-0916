class Song
  attr_accessor :name, :artist_name, :song

  @@all = []
  #
  # def initialize(name)
  #   @name = name
  # end

  def self.song
    @song = song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort! { |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    components = filename.split(" - ")
    song.artist_name = components[0]
    song.name = components[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
