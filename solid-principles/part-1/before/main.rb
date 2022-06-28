require_relative 'shape-calculator'
require_relative 'shapes/triangle'
require_relative 'shapes/rectangle'

shape_calculator = ShapeCalculator.new
triangle = Triangle.new("triangle", 2, 4)
rectangle = Rectangle.new("rectangle", 3, 4)

puts shape_calculator.calculate_area(triangle)
puts shape_calculator.calculate_area(rectangle)
