##
# This module serves as a library for error messages. It's just for aesthetic purposes

module ErrorMessages
  def self.noFile
    p "It seems like the file wasn't found, check the name again"
  end

  def self.emptyFile
    p "There has been an error while parsing the contents of the file, please check that the file is not empty"
  end

  def self.noSpaces
    p "The selected file has no spaces between the name and the score, please check that the file has the correct format"
  end

  def self.wrongScore
    p "The selected file has the wrong format for the score, please remember that the score should be a number between 0 and 10 or have the F value on it"
  end
end
