# takes a number and writes that number to a file then on each line
# increments from zero to the number passed
def write(aFile, number)
    # You might need to fix this next line:
    aFile.puts(number.to_s) # count on file
    index = 0
    while (index < number)
    # write index to file not number
        aFile.puts(index.to_s)
        index += 1
    end
end
    
    # Read the data from the file and print out each line
def read(f)
    f.each_line do |line|
        if is_numeric? line
            puts "Line read: #{line}"
        else
            puts "Line is not number: #{line}"
        end
    end
end
    
    # Write data to a file then read it in and print it out
def main
    aFile = File.open("mydata.txt", "r") # open for reading/writing
    # write(aFile, 10)
    # set file position to beginning
    read(aFile)
    aFile.close
end
    
    # returns true if a string contains only digits
def is_numeric?(obj)
    # use the =~ operator
    if ((/[^0-9]/ =~ obj) == nil)
        true
    else
        false
    end
end
    
main
