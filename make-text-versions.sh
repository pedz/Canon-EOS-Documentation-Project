#!/bin/zsh


function doit ()
{
    awk '-F|' '
    BEGIN {
      print "The Photo/Movie in the first column refers";
      print "to the position of the Photo/Movie switch";
      print;
    }
    NF == 6 {
      print $2, $3, $4, $5;
    }
    ' $1 | sed \
               -e 's% *Tab \([1-9][0-9]*\)/...................................... *%-\1 %' \
               -e 's%^ *Still Photo Shooting%Photo %' \
               -e 's%^ *Movie Recording%Movie %' \
               -e 's% *{{{af-menu}}} *% Pink AF%' \
               -e 's% *{{{comm-menu}}} *% Purple Comm%' \
               -e 's% *{{{control-menu}}} *% Green Control%' \
               -e 's% *{{{custom-menu}}} *% Orange Custom%' \
               -e 's% *{{{movie-menu}}} *% Red Movie%' \
               -e 's% *{{{playback-menu}}} *% Blue Playback%' \
               -e 's% *{{{setup-menu}}} *% Yellow Setup%' \
               -e 's% *{{{star-menu}}} *% Green Star%' \
               -e 's% *{{{still-menu}}} *% Red Still%'
}

doit 'R1 menu table.org' > 'Canon EOS R1 Menu.txt'
doit 'R5MkII menu table.org' > 'Canon EOS R5 Mark II Menu.txt'
