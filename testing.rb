
require './analyse'
require 'pp'

pp "abc"
r = analyse("abc","abc")
pp r
pp r == [true, true, true]

pp "pizza & alpha"
r = analyse("pizza",
            "alpha")
pp r
pp r == [false, false, false, false, true]