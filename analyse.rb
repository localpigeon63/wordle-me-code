def analyse(guess, word)
    guess_chars = guess.chars
    word_chars = word.chars

    pairs = guess_chars.zip(word_chars)
    pairs.map do |pair|
        pair.uniq.length == 1
    end

end