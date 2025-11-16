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

puts found_in_place("Green for go")
puts found_elsewhere("They call me mellow yellow")
puts not_found("The silver lining")

puts "Enter your word here. Your word must be between 4 and 6 letters in length."

matches_masterlist = []
candidate = gets.strip

until candidate.length < 7 &&
    candidate.length > 3 do
    puts "Word is the wrong length. Please enter a word between 4 and 6 letters."
    candidate = gets.strip
end

word = candidate
word_length = candidate.length
system("clear")
alphabet = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", 
"\n", "a", "s", "d", "f", "g", "h", "j", "k", "l", 
"\n", "z", "x", "c", "v", "b", "n", "m"]

puts logo

guess_number = 1
total_guesses = word_length + 1

while guess_number <= total_guesses do

    puts "Enter guess number #{guess_number} out of #{total_guesses}: #{"_ " * word_length}"
    guess = gets.strip

    if guess == word
        puts "🎉 Congratulations! You have wordled me. 🎉"
        exit 0
    elsif guess.length != word.length
        puts "🧮 Your guess is the wrong length. Please guess again. 🧮"
        puts

    else 
        matches = analyse(guess:, word:)
        matches_masterlist.concat(matches)
        matches.each do |match|
            case match.status
            when :perfect_match
                print found_in_place(match.guess_char.to_s + " ")
            when :partial_match
                print found_elsewhere(match.guess_char.to_s + " ")
            when :no_match
                print match.guess_char.to_s + " "
            end
        end
        puts
        puts
        full_matches = matches_masterlist.filter {|match| match.status == :perfect_match}
                        .map {|match| match.guess_char}
        partial_matches = matches_masterlist.filter {|match| match.status == :partial_match}
                        .map {|match| match.guess_char}
        no_matches = matches_masterlist.filter {|match| match.status == :no_match}
                        .map {|match| match.guess_char}
        alphabet.each do |letter|
            if full_matches.include?(letter)
                print found_in_place(letter + " ")
            elsif partial_matches.include?(letter)
                print found_elsewhere(letter + " ")
            elsif no_matches.include?(letter)
                print not_found(letter + " ")
            else
                print letter + " "
            end
        end
        puts
        puts
        guess_number += 1
    end
end

puts "😿 Sorry! You have run out of guesses 😿"