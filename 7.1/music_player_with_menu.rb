require './input_functions'

# It is suggested that you put together code from your 
# previous tasks to start this. eg:
# TT3.2 Simple Menu Task
# TT5.1 Music Records
# TT5.2 Track File Handling
# TT6.1 Album file handling

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
# NB: you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre, :track_numbers, :tracks

# complete the missing code:
	def initialize (title, artist, genre, track_numbers)
		# insert lines here
		@title, @artist, @genre, @track_numbers = title, artist, genre, track_numbers
	end
end

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

def read_albums albums
	puts "--------------"
	puts albums.length
	albums.each{ |album| print_album album }
end

def display_albums albums
	genre = read_integer_in_range("Please enter genre number between 0 and 4 ( or show all albums by entering 0 ):", 0, 4)
	
	albums = genre.to_i == 0 ? albums : albums.select {|album| album.genre.to_i == genre.to_i }

	read_albums albums

end

def select_album albums
	index = read_integer_in_range("Please enter album number between 1 and #{albums.length}:", 1, albums.length.to_i )
	print_album albums[ index.to_i - 1 ]
end

def update_album albums
	index = read_integer_in_range("Please enter album number between 1 and #{albums.length}:", 1, albums.length.to_i )
  album_title   = read_string "Enter album new title:"
  album_genre   = read_integer_in_range("Enter album new genre between 1 - 4:", 1, 4)
  album 				= albums[index]
  album.title   = album_title
  album.genre   = album_genre
  print_album album
end

def read_file f	
	albums = Array.new
	count  = f.gets().to_i
	i = 0.to_i
  while i < count do
  	album = read_album f
	  albums << album
	  i += 1
  end
  albums
end

def read_album f
	album  = Album.new( f.gets, f.gets, f.gets, f.gets )
	tracks = Array.new
	i = 0.to_i
  while i < album.track_numbers.to_i do
  	track = read_track f
	  tracks << track
	  i += 1
  end
  album.tracks = tracks
  album
end

def read_track f
	track = Track.new(f.gets, f.gets)
  track
end

def print_album album
	puts album.title
	puts album.artist
	puts "Genre is #{album.genre}"
	puts $genre_names[album.genre.to_i]
	puts album.track_numbers
	album.tracks.each{ |track| print_track track }
end

def print_track track
	puts track.name
	puts track.location
end


def main  
  
	puts '1. Read in Albums'
	puts '2. Display Albums'
	puts '3. Select an Album to play'
	puts '4. Update an existing Album'
	puts '5. Exit the application'

  choice = read_integer_in_range("Please enter your choice:", 1, 5)

  file 	 = File.new('albums.txt', 'r')
  albums = read_file file
  file.close  
  
  case choice.to_i
    when 1
      read_albums albums
    when 2
      display_albums albums
    when 3
      select_album albums
    when 4
      update_album albums
    when 5
      puts "Good bye..."
  end
  
end

main
