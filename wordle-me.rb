logo = """
▄   ▄  ▄▄▄   ▄▄▄ ▐▌█ ▗▞▀▚▖    ▄▄▄▄  ▗▞▀▚▖
█ ▄ █ █   █ █    ▐▌█ ▐▛▀▀▘    █ █ █ ▐▛▀▀▘
█▄█▄█ ▀▄▄▄▀ █ ▗▞▀▜▌█ ▝▚▄▄▖    █   █ ▝▚▄▄▖
              ▝▚▄▟▌█                     
                                         
"""

require './analyse'
require './colourise'

puts logo

puts "Enter your word here."
word = gets.strip
word_length = word.length
system("clear")

puts logo

(1..5).each do |guess_number|

    puts "Enter guess number #{guess_number}: #{"_ " * word_length}"
    guess = gets.strip

    if guess == word
        puts "Congratulations! You have wordled me."
        exit 0
    else 
        matches = analyse(guess, word)
        matches.zip(guess.chars, word.chars).each do |triple|
            match, guess_char, word_char = triple
            if match
                print green(guess_char.to_s) + " "
            else
                print guess_char + " "
            end
        end
        puts
    end

end

puts "Sorry! You have run out of guesses"