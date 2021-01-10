require "./lib/FileHandling.rb"

BASE_RESULT = ["Jeff 10", "John 3", "John 7", "Jeff 7", "Jeff 3", "John 6", "John 3", "Jeff 9", "Jeff 0", "John 10", "Jeff 10", "John 8", "John 1", "Jeff 0", "Jeff 8", "John 10", "Jeff 8", "Jeff 2", "John 10", "Jeff F", "Jeff 6", "John 9", "John 0", "Jeff 10", "John 7", "John 3", "Jeff 10", "John 4", "John 4", "Jeff 10", "Jeff 8", "Jeff 1", "John 10", "John 9", "John 0"]
MAIK_RESULT = ["Maik 0", "Maik 6", "Maik 1", "Maik 7", "Maik 2", "Maik 8", "Maik 3", "Maik 6", "Maik 4", "Maik 5", "Maik 2", "Maik 3", "Maik 2", "Maik 3", "Maik 2", "Maik 3", "Maik 1", "Maik 7", "Maik 2", "Maik 4"]

describe "#extension" do
  it "Adds a .txt extension if missing" do
    expect(FileHandling.extension("file")).to eql("file.txt")
  end

  it "Returns the file name as is if the .txt extension exists" do
    expect(FileHandling.extension("other_file.txt")).to eql("other_file.txt")
  end
end

describe "#retrieve" do
  it "Returns nil if file not found" do
    expect(FileHandling.retrieve("file.txt")).to eql(nil)
  end
end

describe "#parser" do
  it "Returns nil if file is empty" do
    expect(FileHandling.retrieve("empty.txt")).to eql(nil)
  end
end

describe "#analyzer" do
  it "Returns nil if the file doesn't have spaces between the name and the score" do
    expect(FileHandling.retrieve("no_spaces.txt")).to eql(nil)
  end

  it "Returns nil if the file contains a score lower than 0 or greater than 10" do
    expect(FileHandling.retrieve("negatives.txt")).to eql(nil)

    expect(FileHandling.retrieve("weird_numbers.txt")).to eql(nil)
  end

  it "Returns nil if the file contains letters other than F" do
    expect(FileHandling.retrieve("letters.txt")).to eql(nil)
  end

  it "Returns the correct lines given a file" do
    expect(FileHandling.retrieve()).to eql(BASE_RESULT)
  end

  it "Returns the correct lines given a file" do
    expect(FileHandling.retrieve("Maik.txt")).to eql(MAIK_RESULT)
  end

  it "Ignores breaklines in between the file and returns the correct lines given a file" do
    expect(FileHandling.retrieve("spaces_between.txt")).to eql(BASE_RESULT)
  end
end
