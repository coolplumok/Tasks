require './input_functions'

# Task 6.1 T - use the code from 5.1 to help with this

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

# Returns an array of tracks read from the given file
def read_tracks(music_file)

  count = music_file.gets().to_i()
  tracks = Array.new()
  i = 0.to_i
#Tracks is a array
  while i < count do   # Put a while loop here which increments an index to read the tracks
    track = read_track(music_file)
    tracks << track
    i += 1
  end
  return tracks
end

# reads in a single track from the given file.
def read_track(a_file)
  newTrack = Track.new(a_file.gets, a_file.gets)
  return newTrack
end


# Takes an array of tracks and prints them to the terminal
def print_tracks(tracks)
  size    = tracks.length
  index   = 0.to_i
  
  while index < size do
    print_track tracks[index]
    index += 1
  end
  # Use a while loop with a control variable index
  # to print each track. Use tracks.length to determine how
  # many times to loop.

  # Print each track use: tracks[index] to get each track record
end

# Takes a single track and prints it to the terminal
def print_track(track)
  puts track.name
	puts track.location
end


# search for track by name.
# Returns the index of the track or -1 if not found
def search_for_track_name(tracks, search_string)

	# Put a while loop here that searches through the tracks
	# Use the read_string() function from input_functions.
	# NB: you might need to use .chomp to compare the strings correctly
	# Put your code here.
	track = tracks.find { |obj| obj.name.chomp == search_string.chomp }
	
	if track
		return tracks.find_index track
	else
		return -1
	end
end


# Reads in an Album from a file and then prints all the album
# to the terminal

def main()
		music_file = File.new("album.txt", "r") # open for reading
	  tracks  = read_tracks music_file
	  print_tracks tracks
	  search_string = read_string("Enter the track name you wish to find: ")
  	index = search_for_track_name(tracks, search_string)
  	if index > -1
   		puts "Found " + tracks[index].name + " at " + index.to_s()
  	else
    	puts "Entry not Found"
  	end
  	music_file.close()  	
end

main()

