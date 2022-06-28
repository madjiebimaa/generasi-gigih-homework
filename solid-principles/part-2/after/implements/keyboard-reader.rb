require_relative '../abstracts/reader'

class KeyboardReader < Reader
  def name
    "keyboard"
  end

  def read(input)
    "#{name} read #{input}"
  end
end
