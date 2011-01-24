# Sudoku Solver #

Sudoku Solver is a small project created just for fun, to learn some Ruby.

## Requirements ##

 - git: to get the sources
 - ruby: to run the program (works with ruby 1.8.7)

## Installation ##

To get the source:

    git clone git@github.com:mcrispino/sudoku-solver.git
    
It will create a sudoku-solver folder.

## Running the program ##

First of all, you need to enter the puzzle. To do that, edit the file sudoku-solver/sudoku.rb and change the matrix at the begining of the file.

Then:

    cd sudoku-solver
    ruby sudoku.rb
    
## Output ##

The program prints the original Sudoku and the solved one to the console, something like this:

    $ ruby sudoku.rb 
    Original board => 
       |5| | |8|4| | | | |
       | |2| | | |6| |9| |
       | | | | | |7|6| |1|
       | |8| | | | |4| |7|
       | |3| | | | | |2| |
       |9| |7| | | | |3| |
       |6| |2|4| | | | | |
       | |4| |3| | | |6| |
       | | | | |5|2| | |9|
    Result => 
       |5|1|6|8|4|9|3|7|2|
       |7|2|3|5|1|6|8|9|4|
       |8|9|4|2|3|7|6|5|1|
       |2|8|5|9|6|3|4|1|7|
       |4|3|1|7|8|5|9|2|6|
       |9|6|7|1|2|4|5|3|8|
       |6|5|2|4|9|1|7|8|3|
       |1|4|9|3|7|8|2|6|5|
       |3|7|8|6|5|2|1|4|9|
