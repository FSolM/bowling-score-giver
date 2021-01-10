require "./lib/helpers/ErrorMessages.rb"
require "./lib/Renderer.rb"

##
# This module contains all the necessary funtions to handle and parse the retrieved data from the file

module ContentParser
  ##
  # The #parse will arrange the data that it receives by name and will start to move it around to send it to the
  # renderer. The function uses parallel arrays to save the respective score for each player
  def self.parse(content)
    library = []
    scores = []

    content.each do |line|
      value = line.split(" ")

      if !library.include? value[0]
        library << value[0]
      end

      index = library.index(value[0])
      # This creates an empty array for saving a new player's score
      scores[index] ||= []

      scores[index] << value[1]
    end

    Renderer.init(library, scores)
  end
end
