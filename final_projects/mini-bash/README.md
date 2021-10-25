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
* Piping output to a given file: e.g. `ls > myFile`
* Displaying the hierachical folder structure: `tree`