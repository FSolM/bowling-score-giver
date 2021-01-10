require "./lib/FileHandling.rb"
require "./lib/ContentParser.rb"

p "Input the name of the file. If empty, the program will take the default file"
file = gets.chomp

if file != ""
  # User's using a custom file

  contents = FileHandling.retrieve(FileHandling.extension(file))
else
  # User's using the default file
  contents = FileHandling.retrieve
end

ContentParser.parse(contents) if contents != nil
