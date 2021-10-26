# MINI BASH

This project aims to emulate a bash interpreter in the browser, using Elm. All the file
system will be stored in Elm data structure, no interaction with "the real world" is
expected.

**Simplifications:** creation/modification date will not be supported.

Minimal list of commands to support:
* List all files in the current directory: `ls`
* Create a file: `touch nameOfFile`
* Change directory: `cd directory`
* Make directory: `mkdir nameOfDirectory`
* Display some string: `echo foo`

Optional features:
* Piping output to a given file: e.g. `ls > myFile`. This can be used to write some content into files, eg. `echo test > file.txt`
* Concatenate the content of multiple files: `cat file1 file2`
* Displaying the hierachical folder structure: `tree`
* Handling some options in commands, like `ls -l` or `mkdir -p`
