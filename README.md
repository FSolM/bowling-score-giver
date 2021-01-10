# Bowling Score Giver

## A Ruby command-line application that displays the score of a bowling match given a file input

*My creativity dried while thinking about this project's name*

This console application displays a stylized (to a certain extend) bowling score given a file input.

To run the application, you need to first run the `main.rb` file in the root of this repo. It can be done with the command:

```
$ ruby main.rb
```

It'll ask for a file name. There are already some test files in this project located in the `files` folder; to use a custom file, add it to the folder. You can provide the application the file name with or without the extension `.txt`.

This project contains some automated test cases that were made using `rspec`. To run them, fist make sure that the `rspec` gem is already installed. If not, run the command:

```
$ gem install rspec
```

To run the test file, execute the command:

```
$ rspec
```

It'll run through all the available test cases.
