#!/bin/zsh

# Filter to pull function entries out of the R5 Mark II web page
#
# Typical Usage:
#
# ./R5MkII-filter.sh > R5.out
#
# Sample Pattern
# <td class="bgcolor left" colspan="13"><img class="print_icon"
#   src="screens/icon_le-mf-d.svg" alt="">:
#   <span class="tm RSTR_BTN_SWAP_NONE">No function (disabled)</span></td>
#
# Note that the "airplane mode" entry has a colspan of 17 instead of
# 13.  Someone goofed

pattern='<td class="bgcolor left" colspan="1[37]"><img class="print_icon" src="screens'
file=cam.start.canon/en/C017/manual/html/UG-08_Customize_0030.html

grep $pattern $file | \
    sed -e 's%^[ 	]*<td class="bgcolor left" colspan="1[37]">%%' \
        -e 's%<img class="print_icon" src="screens\(/[^"]*\)" alt="[^"]*">%* [[file:svg\1]]%g' \
        -e 's%</span></td>$%%' \
        -e 's%<span class="tm [0-9A-Z_]*">%%g' \
        -e 's%</span>\*<span class="sup">[0-9]%%' \
        -e 's%</span>% -%' | \
    cat
