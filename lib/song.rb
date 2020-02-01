require 'pry'
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
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    filename.chomp!('.mp3')
    split_filename = filename.split(' - ')
    song = self.new_by_name(split_filename[1])
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    filename.chomp!('.mp3')
    split_filename = filename.split(' - ')
    song = self.create_by_name(split_filename[1])
    song.artist_name = split_filename[0]
  end
  
  def  self.destroy_all
    self.all.clear
  end
end
