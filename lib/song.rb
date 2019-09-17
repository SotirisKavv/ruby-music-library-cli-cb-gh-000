class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def self.new_from_filename(filename)
    infos = filename.split(" - ")
    if Song.find_by_name(infos[1]) == nil
      song = Song.new(infos[1])
      song.artist = infos[0]
      song.genre = infos[2].gsub(".mp3", "")
    end
    song
  end

  def self.create_by_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end


end
