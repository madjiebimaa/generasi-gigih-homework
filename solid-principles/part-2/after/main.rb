require_relative 'implements/copier'
require_relative 'implements/printer'
require_relative 'implements/keyboard-reader'
require_relative 'implements/scanner'
require_relative 'implements/printer-reader'

copier = Copier.new

copier.copy(KeyboardReader.new, Printer.new, "Hello world")

copier.copy(PrinterReader.new, Scanner.new, "Hello Generasi GIGIH 2")
