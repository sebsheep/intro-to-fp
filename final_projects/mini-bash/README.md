# MINI BASH

This project aims to emulate a bash interpreter in the browser, using Elm. All the file
system will be stored in a Elm data structure, no interaction with "the real world" is
expected. E.g., refreshing the web page would totally remove all the data.


**Simplifications:** creation/modification date will not be supported.

## Minimal list of commands to support
* Create a file with an empty content: `touch nameOfFile`
* List all files and directories in the current directory: `ls`
* Make directory: `mkdir nameOfDirectory`
* Change directory: `cd directory`
* Implement the `pwd` command.

## Optional features
* Handling some options in commands, like `ls -l` or `mkdir -p`
* Putting content into files:
    - Display some string: `echo foo`
    - Piping output to a given file: e.g. `ls > myFile`. This can be used to write some content into files, eg. `echo test > file.txt`
    - Concatenate the content of multiple files: `cat file1 file2`
* Displaying the hierachical folder structure: `tree`
* Make `ls` handle an argument, listing all the files matching the argument. E.g., `ls b*` would display `bar` and `baz` files.
* Copy and move:
    - Implement `cp` and `mv` with "basic" paths (no wildcard).
    - Handle wildcards in `cp` and `mv`.
* Use a "tree zipper" to implement navigation through `cd`.
* make it possible for the user to save the current session as a file and to restore the session by loading the file.
  *Hint: the whole state of the session only depends on the user commands.*

