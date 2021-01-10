require "./lib/helpers/ErrorMessages.rb"

##
# This module contains all the methods that are necessary for handling and parsing the data from the text file

module FileHandling
  VALUES = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "F"]

  ##
  # The #extension works as a quick inspector of the inputted file name; it checks if the user added the .txt file extension, if not, it adds
  # it to the string
  def self.extension(file_name)
    if file_name.include? ".txt"
      return file_name
    else
      return file_name + ".txt"
    end
  end

  ##
  # The #retrieve receives a string as a param and searches the files folder for it. It then opens the selected file and parses the contents.
  # It also contains the first conditional for checking that the contents of the file are valid
  def self.retrieve(file = "base.txt")
    path = Dir.pwd + "/files/" + file

    if File.exists? path
      file = File.open(Dir.pwd + "/files/" + file, "r")
    else
      ErrorMessages.noFile
      return nil
    end

    parser(file)
  end

  ##
  # The #parser works as the entry point of the conditions analysis of the module. It will check that the current file is not empty and if its
  # not, will send said file to the #analyzer
  def self.parser (file)
    # The file is empty, it doens't need to be analyzed
    if File.zero? file
      ErrorMessages.emptyFile
      return nil
    end

    analyzer(file)
  end

  ##
  # The #analyzer works as the looper that adds all the file data into a workable array; it's also where some of the conditions of a valid file are
  # made
  def self.analyzer(file)
    lines = []

    data = file.readlines.each do |line|
      line = line.chomp

      # If line has a blank space, it jumps it
      next if line == ""
      
      # If the line doesn't contain a space between the score and name, it exits with nil
      if !line.include? " "
        ErrorMessages.noSpaces
        return nil
      end

      # If the last value of the string is not a number between 0 and 10 or the letter F, it exits with nil
      if !self::VALUES.include? line.split(" ")[1]
        ErrorMessages.wrongScore
        return nil
      end 

      lines << line
    end

    lines
  end
end
