class Copier
  def copy(input)
    reader = KeyboardReader.new
    writer = Printer.new

    reader.read(input)
    writer.write(input, reader.name)
  end
end
