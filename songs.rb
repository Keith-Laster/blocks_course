require_relative 'my_enumerable'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_file_name
    base = "#{name}-#{artist}".gsub(' ', '-').downcase
    extensions = ['.mp3', '.wav', '.aac']
    extensions.each { |ext| yield base + ext }
  end
end

song1 = Song.new('Soul Survivor', 'Young Jeezy', 3)
song2 = Song.new('Ya', 'Usher', 2.5)
song3 = Song.new('Get Low', 'Lil John', 3.2)

class Playlist
  # include Enumerable
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each do |s|
      puts "Yielding #{s.name}..."
      yield s
    end
  end

  def play_songs
    each { |s| s.play }
  end

  def each_tagline
    @songs.each { |s| yield "#{s.name} - #{s.artist}" }
  end

  def each_by_artist(artist, &block)
    my_select { |s| s.artist == artist }.each(&block)
  end
end

playlist1 = Playlist.new('Bangers')
playlist1.add_song(song1)
playlist1.add_song(song2)
playlist1.add_song(song3)

playlist1.each { |s| s.play }
playlist1.play_songs
p '.....'
soul_songs = playlist1.my_select { |s| s.name =~ /Soul/ }
p soul_songs

lil_songs = playlist1.my_select { |s| s.artist =~ /Lil/ }
p '...'
# p lil_songs.my_map { |s| "#{s.name}, #{s.artist}" }

durations = playlist1.my_map { |s| s.duration }.reduce(:+)
p durations

playlist1.each_tagline { |tagline| puts tagline }

p playlist1.each_by_artist('Lil John')

p '....kjakjkdjfkjask.....'

song1.each_file_name { |f| puts f }
