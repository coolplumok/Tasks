require './input_functions'

# It is suggested that you put together code from your 
# previous tasks to start this. eg:
# TT3.2 Simple Menu Task
# TT5.1 Music Records
# TT5.2 Track File Handling
# TT6.1 Album file handling

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']
$albums 		 = []

class Album
# NB: you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre, :track_numbers, :tracks

# complete the missing code:
	def initialize (artist, title, genre, track_numbers)
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
	album  = Album.new( f.gets.chomp, f.gets.chomp, f.gets.chomp, f.gets.chomp )
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
	track = Track.new(f.gets.chomp, f.gets.chomp)
  track
end

def print_albums albums	
	puts `clear`
	puts "No albums to display..." if albums.empty?
	albums.each_with_index do |album, index|
		puts "Album ID: #{ $albums.find_index( album ) + 1}"
		print_album album
		puts "\n"
	end
end

def print_album album
	puts "-=#{ $genre_names[album.genre.to_i] }=-"
	puts "> #{ album.title } by #{album.artist}"
end

def print_album_with_tracks id, album
	puts "Album ID: #{id}"
	print_album album
	puts "  Track List:"
	album.tracks.each_with_index{ |track, index| puts "#{index + 1} - #{track.name}" }
end

def select_genres
	puts "    Select Genre"
	puts "----------------------"
	$genre_names.each_with_index{ |genre, index| puts "#{index} - #{genre}" if index > 0  }
	genre = read_integer_in_range("option:", 1, $genre_names.length )
	genre.to_i
end

def play_album album
	puts "    Track List"
	puts "----------------------"
	album.tracks.each_with_index{ |track, index| puts "#{index + 1} - #{track.name}" }
	track_id = read_integer_in_range("option:", 1, album.tracks.length )
	track_id = track_id.to_i - 1
	play_track album.title, album.tracks[track_id]
end

def play_track album, track
	puts `clear`
	puts "         Playing"
	puts "----------------------------------"
	puts "ALBUM: #{album}"
	puts track.name
	puts "♪ ♫ ♪ ♫ ♪ ♫ ♪ ♫ ♬ ..."
	go_main
end

def search_for_album
	puts `clear`
	puts "    Search for Album"
	puts "----------------------"
	puts "1 - Search by Genre"
	puts "2 - Search by Title"
	choice  = read_integer_in_range "option", 1, 2
	case choice.to_i
		when 1
			genre = select_genres
			print_albums $albums.select {|album| album.genre.to_i == genre.to_i }
			id = read_integer_in_range("Album ID:", 1, $albums.length)
			id = id.to_i - 1
			play_album $albums[id]
		when 2
			title = read_string "Title:"
			play_album $albums.find {|album| album.title == title }
	end
end

def select_track album
	puts `clear`
	puts "    Select Track"
	puts "----------------------"
	album.tracks.each_with_index{ |track, index| puts "#{index + 1} - #{track}" }
	track = read_integer_in_range("option:", 1, album.tracks.length )
	track.to_i - 1
end

def update_track album, track
	puts `clear`
	puts "    Update Track"
	puts "----------------------"
	puts "1 - Title"
	puts "2 - Filename"
	choice = read_integer_in_range "option:", 1, 3
	case choice.to_i
		when 1
			name = read_string "New Title:"
			$albums[album].tracks[track].name = name
			print_album_with_tracks album + 1, $albums[index]
		when 2
			puts "Update Filename of Track"	
	end
end

def go_main
	enterkey = ''
  while enterkey != "\n"
  	puts "Press Enter..."
		enterkey = gets
	end
	main
end

# main options

def read_albums
	puts `clear`
	puts "          Enter Album"
	puts "-------------------------------------"
	filename = ""
	while !File.exist?(filename)
		filename = read_string("Enter the filename of music library.")
	end
	file 	  = File.new('albums.txt', 'r')
  $albums = read_file file
  file.close
  puts "Music Library Loaded."
  go_main
end

def display_albums
	puts `clear`
	puts "    Display Albums"
	puts "----------------------"
	puts "1 - Display All"
	puts "2 - Display Genre"
	choice = read_integer_in_range("Please enter your choice:", 1, 2)
	case choice.to_i
		when 1
			print_albums $albums
		when 2
			genre 	= select_genres	
			print_albums $albums.select {|album| album.genre.to_i == genre.to_i }		
	end
	go_main
end

def select_album
	puts `clear`
	puts "    Play Album"
	puts "----------------------"
	puts "1 - Play by ID"
	puts "2 - Search"
	choice = read_integer_in_range("Please enter your choice:", 1, 2)
	case choice.to_i
		when 1
			id = read_integer_in_range("Album ID:", 1, $albums.length)
			id = id.to_i - 1
			play_album $albums[id]
		when 2
			search_for_album		
	end
end

def update_album
	puts `clear`
	puts "    Update Album"
	puts "----------------------"
	index = read_integer_in_range("Album ID:", 1, $albums.length.to_i )
	puts `clear`
	puts "    Update Album"
	puts "----------------------"
	puts "1 - Update Title"
	puts "2 - Update Genre"
	# puts "3 - Update Track"
	choice = read_integer_in_range "option:", 1, 3
	case choice.to_i
		when 1
			title = read_string "New Title:"
			$albums[index].title = title
			print_album $albums[index]
		when 2
			genre = select_genres
			$albums[index].genre = genre
			print_album $albums[index]	
		# when 3
		# 	track = select_track $albums[index]
		# 	update_track index, track
	end
	go_main
end

# main function


def main  
  puts `clear`
  puts '    Main Menu:'
  puts '----------------------------'
	puts '1 - Read in Albums'
	puts '2 - Display Albums'
	puts '3 - Select an Album to play'
	puts '4 - Update an existing Album'
	puts '5 - Exit the application'

  choice = read_integer_in_range("Please enter your choice:", 1, 5)    
  
  case choice.to_i
    when 1
      read_albums
    when 2
    	if $albums.empty?
		  	puts "No music library loaded..."
		    go_main
		  else
		  	display_albums
		  end      
    when 3
    	if $albums.empty?
		  	puts "No music library loaded..."
		    go_main
		  else
      	select_album
		  end
    when 4
    	if $albums.empty?
		  	puts "No music library loaded..."
		    go_main
		  else
		  	update_album
		  end      
    when 5
      puts "Good bye..."
  end
  
end

main
