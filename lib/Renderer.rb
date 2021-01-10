module Renderer
  def self.init(library, scores)
    render = "\n"

    library.each do |player|
      render += frame() + "\n"
      render += player + "\n"
      render += score(scores[library.index(player)]) + "\n"
    end

    print render
  end

  def self.frame
    return "Frame      1      2      3      4      5      6      7      8      9     10"
  end

  ##
  # The #score renderer contains both the pinfalls and the total score renders because they basically use the same way of
  # retrieving data with slight modifications. It'll tabulate all the points that a playar may have had in a game. It
  # triggers the last conditional: the number of frames registered in the file. It can either be 10, 11 or 12 with their
  # respective additional conditions. If it doesn't fulfil them, an error will be raised. Technically, bowling only has
  # 10 frames, but because of how this functions counts the frames, a player may have more than 10 frames at the end of
  # the game
  def self.score(score)
    string_pinfalls = "Pinfalls   "
    string_total = "Score      "

    total = 0
    i = 0
    frame = 1

    while i < score.length
      # The following conditionals handle the score until frame 10
      if frame < 10
        # Strike conditional
        if score[i] == "10"
          string_pinfalls += "    X"

          total += 10 + foulParser(score[i + 1]) + foulParser(score[i + 2])

          i += 1
        # Spare conditional
        elsif foulParser(score[i]) + foulParser(score[i + 1]) == 10
          string_pinfalls += score[i] + "   /"

          total += foulParser(score[i]) + foulParser(score[i + 1]) + foulParser(score[i + 2])

          i += 2
        # Normal scoring conditional
        else
          string_pinfalls += score[i] + "   " + score[i + 1]

          total += foulParser(score[i]) + foulParser(score[i + 1])

          i += 2
        end
        
        string_pinfalls += "  "
        string_total += total.to_s
        
        if total < 10
          string_total += "      "
        elsif total >= 10 && total < 100
          string_total += "     "
        else
          string_total += "    "
        end

        frame += 1
        # The following conditionals handle the score in the frame 10
      else
        # Strike conditional - Ends the game
        if score[i] == "10"
          string_pinfalls += "X   " + (score[i + 1] == "10" ? "X" : score[i + 1]) + "   " + (score[i + 2] == "10" ? "X" : score[i + 2])

          total += 10 + foulParser(score[i + 1]) + foulParser(score[i + 2])

          break
        # Spare conditional
        elsif foulParser(score[i]) + foulParser(score[i + 1]) == 10 && i < score.length - 1
          string_pinfalls += score[i] + "  /"

          total += foulParser(score[i]) + foulParser(score[i + 1]) + foulParser(score[i + 2])

          i += 2
        # Normal scoring conditional
        else
          string_pinfalls += score[i] + "   " + score[i + 1]

          total += foulParser(score[i]) + foulParser(score[i + 1])

          break
        end
      end
    end

    string_total += total.to_s
    
    return string_pinfalls + "\n" + string_total
  end

  ##
  # The #foulParser checks if the current value of score has the F value, if it does, it returns 0, if it doens't, it
  # returns the param value as a integer
  def self.foulParser(value)
    return value == "F" ? 0 : value.to_i
  end
end
