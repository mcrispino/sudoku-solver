class Board
	attr_accessor :matrix
	
	module Initialization
		def initialize
			@matrix = Array.new(9) { Array.new(9) { [1,2,3,4,5,6,7,8,9] } }
		end
	end
	
	module QueryBoardState
		def has_all_values?
			!check_any( lambda { |val| val.kind_of?(Array) } )
		end
		
		def invalid?
			check_any( lambda { |val| val.kind_of?(Array) && val.count == 0 } )
		end
		
		private
		
			def check_any(block)
				self.each do |val|
					return true if block.call(val)
				end
				return false
			end
	end
	
	module ValueSetting
		def set_value(val, row, col)
			matrix[row][col] = val
			remove_value_from_column(val, col)
			remove_value_from_row(val, row)
			remove_value_from_quadrant(val, row, col)
		end
		
		def load_values(m)
			self.each_with_indexes do |temp, row, col|
				val = m[row][col]
				set_value(val, row, col) if val != 0
			end
		end
		
		private

			def remove_value_at(val, row, col)
				matrix[row][col].delete val if matrix[row][col].kind_of?(Array)
			end
	
			def remove_value_from_column(val, col)
				(0..8).each do |row|
					remove_value_at(val, row, col)
				end
			end
			
			def remove_value_from_row(val, row)
				(0..8).each do |col|
					remove_value_at(val, row, col)
				end
			end
			
			def remove_value_from_quadrant(val, row, col)
				row_ini = (row / 3) * 3
				row_end = row_ini + 2
				col_ini = (col / 3) * 3
				col_end = col_ini + 2
				
				(row_ini..row_end).each do |b_row|
					(col_ini..col_end).each do |b_col|
						remove_value_at(val, b_row, b_col)
					end
				end
			end
	end
	
	module Solving
		include QueryBoardState
	
		def solve
			result = process_cells_with_one_posibility!
			return false if !result
			
			if has_all_values?
				return true
			else
				self.each_with_indexes do |val, row, col|
					if val.kind_of?(Array)
						val.each do |item|
							temp_board = Marshal.load( Marshal.dump(self) )
								
							temp_board.set_value(item, row, col)
							if temp_board.invalid?
								return false
							else
								solved = temp_board.solve
								if solved
									copy_from temp_board
									return true
								end
							end
						end
					end
				end
			end
		end
		
		private
		
			def copy_from(board)
				board.each_with_indexes do |val, row, col|
					self.matrix[row][col] = val
				end
			end

			def process_cells_with_one_posibility!
				finished = false
				while !finished do
					did_change = false
					self.each_with_indexes do |val, row, col|
						if val.kind_of?(Array) && val.count == 1
							set_value(val[0], row, col)
						
							did_change = true
						end
					end
				
					if invalid?
						return false
					end
			
					finished = !did_change || has_all_values?
				end
				
				return true
			end
	end
	
	module Iterators
		def each
			(0..8).each do |r|
				(0..8).each do |c|
					yield matrix[r][c]
				end
			end
		end
		
		def each_with_indexes
			(0..8).each do |r|
				(0..8).each do |c|
					yield(matrix[r][c], r, c)
				end
			end
		end
	end
	
	include Initialization
	include ValueSetting
	include Solving
	include Iterators
end
