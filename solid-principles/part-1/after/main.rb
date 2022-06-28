require_relative 'shape-calculator'
require_relative 'shapes/triangle'
require_relative 'shapes/rectangle'
require_relative 'shapes/circle'

shape_calculator = ShapeCalculator.new
triangle = Triangle.new(2, 4)
rectangle = Rectangle.new(3, 4)
circle =  Circle.new(10)

puts shape_calculator.calculate_area(triangle)
puts shape_calculator.calculate_area(rectangle)
puts shape_calculator.calculate_area(circle)
