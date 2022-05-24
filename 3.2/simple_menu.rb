
require './input_functions'

def maintain_albums again
  
  if again
    puts 'Please Select Again'
  else
    puts ('Maintain Albums Menu:')
    puts ('1 To Update Album Title')
    puts ('2 To Update Album Genre')
    puts ('3 To Enter Album')
    puts ('4 Exit')
    puts 'Please enter your choice:'
  end

  choice = gets.chomp
  
  case choice.to_i
    when 1
      update_album_title false
    when 2
      update_album_genre false
    when 3
      enter_album false
    when 4
      main false
    else
      maintain_albums true
    end
end

def play_existing_album again
  if again 
    puts 'Please Select Again'
  else
    puts 'You selected Play Existing Album. Press enter to continue.'
  end
  choice = gets
  case choice
    when "\n"
      main false
    else
      main true
  end
end

def update_album_title again
  if again 
    puts 'Please Select Again'
  else
    puts 'You selected Update Album Title. Press enter to continue.'
  end
  choice = gets
  case choice
    when "\n"
      maintain_albums false
    else
      update_album_title true
  end
end

def update_album_genre again
  if again 
    puts 'Please Select Again'
  else
    puts ('You selected Update Album Genre. Press enter to continue.')
  end
  choice = gets
  case choice
    when "\n"
      maintain_albums false
    else
      update_album_genre true
  end
end

def enter_album again
  if again 
    puts 'Please Select Again'
  else
    puts ('You selected Enter Album. Press enter to continue.')
  end
  choice = gets
  case choice
    when "\n"
      maintain_albums false
    else
      update_album_genre true
  end  
end

def main again
  
  if again
    puts 'Please select again'
  else
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play Existing Album'
    puts '3 Exit'
    puts 'Please enter your choice:'
  end

  choice = gets.chomp
  
  case choice.to_i
    when 1
      maintain_albums false
    when 2
      play_existing_album false
    when 3
      puts "Good bye..."
    else
      main true
  end
  
end

main false
