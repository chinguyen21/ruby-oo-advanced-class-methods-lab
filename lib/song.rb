
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save << new_song
    new_song
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song

  end
  
  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    new_song.save
    new_song
  end

  def self.find_by_name(finding_song)
    @@all.find {|song| song.name == finding_song}
  end

  def self.find_or_create_by_name(song)
    if !self.find_by_name(song) 
      self.create_by_name(song)
    else 
      self.find_by_name(song)
    end

  end

  def self.alphabetical
    new_array = []
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_the_extension = file_name.split(".")[0]
    split_artist_and_song = split_the_extension.split(" - ")
    new_song = self.new
    new_song.artist_name = split_artist_and_song[0]
    new_song.name = split_artist_and_song[1]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end


end

