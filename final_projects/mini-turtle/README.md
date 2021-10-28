# MINI-TURTLE

This projects aims to reproduce basic features of the Logo programming
langage: the user enters a list of commands that make a turtle moving on
the screen. The turtle has a pen on its tail, so we can draw with it!

**SIMPLIFCATIONS:** we wont try making the turtle smoothlessly move. When the user
enters the command, the turtle immediatly move to its next position and the line
is directly drawn.

Minimal set of features:
* support the `forward 10` command which makes the turtle advance by 10 units (up to you to define 
  what a handy "unit" would be: px? 100px?). *Note: of course, the `10` can vary, the user may enter any integer.*
* support the `pen_up` and `pen_down` instructions. When the pen is "up", the turtle moves without
  drawing anything behind it.
* support `turn_left 20` and `turn_right 20` which makes the turtle turn on it self by `20` degrees (once again, this
  `20` may actually be any integer).





Additional optional features:
* make it possible for the user to save the current session as a file and to restore the session by loading the file.
  *Hint: the whole state of the session only depends on the user commands.*

