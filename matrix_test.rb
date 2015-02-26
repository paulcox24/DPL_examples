
require_relative 'matrix'

class RotationTest
  def test_square_rotation
    square = [
      [0, 1, 0, 0],
      [0, 1, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
    ]
    
    square_rotated = [
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 0, 0],
      [0, 0, 0, 0]
    ]
    
    if square_rotated == Matrix.rotate(square)
      puts "Square passed"
    end
  end
  
  def test_rectangular_rotation
    rectangle = [
      [0, 1, 0],
      [1, 1, 1]
    ]
    
    rectangle_rotated = [
      [0, 1],
      [1, 1],
      [0, 1]
    ]
    
    if rectangle_rotated == Matrix.rotate(rectangle)
      puts "Rectangle passed"
    end
  end
end  

test = RotationTest.new
test.test_square_rotation
test.test_rectangular_rotation