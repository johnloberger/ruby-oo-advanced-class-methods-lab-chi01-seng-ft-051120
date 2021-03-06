class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # SAVES SONG
  def save
    self.class.all << self
  end

  # INSTANTIATES AND SAVES SONG
  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    pair = filename.split(" - ")
    artist_name = pair[0]
    song_name = pair[1].chomp(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    pair = filename.split(" - ")
    artist_name = pair[0]
    song_name = pair[1].chomp(".mp3")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
