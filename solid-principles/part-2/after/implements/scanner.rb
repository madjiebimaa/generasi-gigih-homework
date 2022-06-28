require_relative '../abstracts/writer'

class Scanner < Writer
  def write(input, reader_name)
    "printer prints '#{input}' from #{reader_name}"
  end
end
