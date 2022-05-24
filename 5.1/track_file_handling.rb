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
def print_tracks(music_file)
  tracks  = read_tracks(music_file)
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

# Open the file and read in the tracks then print them
def main()
  a_file = File.new("input.txt", "r") # open for reading
  print_tracks(a_file)
  # read_tracks(a_file)
  a_file.close()
end
#Call read_tracks after line 58.
main()
