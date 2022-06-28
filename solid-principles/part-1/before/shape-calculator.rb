class ShapeCalculator
  def initialize
  end

  def calculate_area(shape)
    area = 0

    if shape.name == "rectangle"
      area = shape.width * shape.length
    elsif shape.name == "triangle"
      area = shape.base * shape.height * 0.5
    end

    area
  end
end
