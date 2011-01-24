module Helpers
	def Helpers.print_matrix(m)
		(0..8).each do |i|
			print "   "
			(0..8).each do |j|
				print "|"
				print "[" if m[i][j].kind_of?(Array)
				print m[i][j] == 0 ? " " : m[i][j]
				print "]" if m[i][j].kind_of?(Array)
			end
			puts "|"
		end
	end
end
