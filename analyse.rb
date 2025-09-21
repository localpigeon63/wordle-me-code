# pizza
# alpha
# NoMatch(a), NoMach(l), Partial(p), NoMatch(h), FullMatch(a)

def analyse(guess, word)
    guess_chars = guess.chars
    word_chars = word.chars

    pairs = guess_chars.zip(word_chars)

    pairs.map do |pair|
        pair.uniq.length == 1
    end
    # perfect_matches = []
    # pairs.each_with_index do |pair, index|
    #     perfect_matches << index if pair.uniq.length == 1
    # end
end




# copy word, copy guess
# remove perfect matches
# iterate through guess, check if each letter contained in word
# remove from word if found
# return 