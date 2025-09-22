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

(1..5).each do |guess_number|

    puts "Enter guess number #{guess_number}: #{"_ " * word_length}"
    guess = gets.strip

    if guess == word
        puts "Congratulations! You have wordled me."
        exit 0
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
    end
end

puts "Sorry! You have run out of guesses"