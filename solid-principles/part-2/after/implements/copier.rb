class Copier
  def copy(reader, writer, input)
    puts reader.read(input)
    puts writer.write(input, reader.name)
  end
end
