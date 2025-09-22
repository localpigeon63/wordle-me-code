# pizza
# alpha
# NoMatch(a), NoMach(l), Partial(p), NoMatch(h), FullMatch(a)

Match = Data.define(:index, :guess_char, :word_char, :status)

def analyse(guess:, word:)
    guess_chars = guess.chars
    word_chars = word.chars

    triples = (0..(word.length-1)).zip(guess.chars, word.chars)

    matches = []

    triples.each do |triple|
        index, guess_char, word_char = triple
        if guess_char == word_char
            matches << Match.new(index, guess_char, word_char, :perfect_match)
        end
    end

    match_indices = matches.map {|match| match.index}

    unmatched_triples = triples.reject do |triple|
        index, _, _ = triple
        match_indices.include?(index)
    end

    unmatched_word_chars = []

    unmatched_triples.each do |triple|
        index, guess_char, word_char = triple
        unmatched_word_chars << word_char
    end

    unmatched_triples.each do |triple|
        index, guess_char, word_char = triple
        if unmatched_word_chars.include?(guess_char)
            matches << Match.new(index, guess_char, word_char, :partial_match)
            unmatched_word_chars.delete(guess_char)
        end
    end

    match_indices = matches.map {|match| match.index}

    no_matches = triples.reject do |triple|
        index, _, _ = triple
        match_indices.include?(index)
    end

    no_matches.each do |triple|
        index, guess_char, word_char = triple
        matches << Match.new(index, guess_char, word_char, :no_match)
    end
    return matches.sort_by{|match| match.index}
end



# copy word, copy guess
# remove perfect matches
# iterate through guess, check if each letter contained in word
# remove from word if found
# return 