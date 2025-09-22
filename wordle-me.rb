logo = """
▄   ▄  ▄▄▄   ▄▄▄ ▐▌█ ▗▞▀▚▖    ▄▄▄▄  ▗▞▀▚▖
█ ▄ █ █   █ █    ▐▌█ ▐▛▀▀▘    █ █ █ ▐▛▀▀▘
█▄█▄█ ▀▄▄▄▀ █ ▗▞▀▜▌█ ▝▚▄▄▖    █   █ ▝▚▄▄▖
              ▝▚▄▟▌█                     
                                         
"""

require './analyse'
require './colourise'

system("clear")

puts logo

puts "Enter your word here."
word = gets.strip
word_length = word.length
system("clear")

puts logo

guess_number = 1

while guess_number <= 5 do

    puts "Enter guess number #{guess_number}: #{"_ " * word_length}"
    guess = gets.strip

    if guess == word
        puts "🎉 Congratulations! You have wordled me. 🎉"
        exit 0
    elsif guess.length != word.length
        puts "🧮 Your guess is the wrong length. Please guess again. 🧮"
        puts

    else 
        matches = analyse(guess:, word:)
        matches.each do |match|
            case match.status
            when :perfect_match
                print green(match.guess_char.to_s + " ")
            when :partial_match
                print yellow(match.guess_char.to_s + " ")
            when :no_match
                print match.guess_char.to_s + " "
            end
        end
        puts
        puts
        guess_number += 1
    end
end

puts "😿 Sorry! You have run out of guesses 😿"