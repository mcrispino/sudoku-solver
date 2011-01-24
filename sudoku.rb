
m = [
 [5,0,0,8,4,0,0,0,0], 
 [0,2,0,0,0,6,0,9,0], 
 [0,0,0,0,0,7,6,0,1], 
 [0,8,0,0,0,0,4,0,7], 
 [0,3,0,0,0,0,0,2,0], 
 [9,0,7,0,0,0,0,3,0], 
 [6,0,2,4,0,0,0,0,0], 
 [0,4,0,3,0,0,0,6,0], 
 [0,0,0,0,5,2,0,0,9]
]

require 'helpers'
require 'board'

puts "Original board => "
Helpers::print_matrix(m)

board = Board.new
board.load_values(m)

puts board.solve ? "Result => " : "Doesn't seem to be valid... So far I got => "
Helpers::print_matrix(board.matrix)
