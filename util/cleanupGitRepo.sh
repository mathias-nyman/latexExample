#!/bin/bash

#---------------------------------------
# Remove all occurances of the files
# specified in .gitignore
#---------------------------------------

# a one-liner, for the sake of one-liners... not at all readable though..
cat .gitignore | perl -ne 'if(/^\s*$/ || /^\s*#/){next} chomp(); $f=$_; unlink(glob $f);if(/^\s*\*/){$f="**/$f";} unlink(glob $f)'
