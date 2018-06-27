class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import 
  end
  
  def call 
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
      self.call unless input == "exit"
  end
  
  def list_songs
    sorted = Song.all.sort{|x,y| x.name <=> y.name}
    sorted.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted = Artist.all.sort{|x,y| x.name <=> y.name}
    sorted.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end
  
  def list_genres
    sorted = Genre.all.sort {|x,y| x.name <=> y.name}
    sorted.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
      sorted_songs = artist.songs.sort {|x,y| x.name <=> y.name}
      sorted_songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil 
      songs = genre.songs.sort {|x,y| x.name <=> y.name}
      songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    
    
  end
  
end