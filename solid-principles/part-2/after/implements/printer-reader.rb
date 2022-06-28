require_relative '../abstracts/reader'

class PrinterReader < Reader
  def name
    "printer reader"
  end

  def read(input)
    "#{name} read #{input}"
  end
end
