require 'rainbow'

def found_in_place(string)
  Rainbow(string).green
end

def found_elsewhere(string)
  Rainbow(string).yellow
end

def not_found(string)
  Rainbow(string).strike
end