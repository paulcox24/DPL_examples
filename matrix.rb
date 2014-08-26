class Matrix 


	def self.rotate(matrix)
		#find rows 
		matrix_rows = matrix.length
		#and columns
		matrix_cols = matrix[0].length

		matrix.each { |r| puts r.inspect}

		puts (' ')

		#create a new matrix the 
		rotated_matrix = Array.new(matrix_cols) { |rows| Array.new(matrix_rows) { |cols| matrix[cols][matrix_cols - 1 - rows] } }
	  #rotated_matrix = matrix.transpose.reverse
		#display the new matrix
	  rotated_matrix.each { |row| puts row.inspect}

	end	


end

rectangle = [
  [0, 1, 0],
  [1, 1, 1]
]
square = [
	[1, 0, 0, 2],
	[0, 1, 1, 0],
  [0, 0, 1, 0],
  [3, 0, 0, 4]
]

Matrix.rotate(square)
puts ''
Matrix.rotate(rectangle)
