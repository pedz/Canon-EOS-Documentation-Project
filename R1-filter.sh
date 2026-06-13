#!/bin/zsh

# Filter to pull function entries out of the R1 web page
#
# Typical usage:
#
# ./R1-filter.sh > R1.out
#
# Sample Pattern
# <td class="bgcolor left" colspan="17"><img class="print_icon" 
#   src="screens/icon_switch-af-point.svg" alt="">:
#   <span class="tm RSTR_BTN_SWAP_TO_REG_AFFRAME">Switch to registered AF point
#   </span>*<span class="sup">1</span></td>
# Uncomment these two lines
pattern='<td class="bgcolor left" colspan="17"><img class="print_icon" src="screens'
file=cam.start.canon/en/C018/manual/html/UG-08_Customize_0030.html


grep $pattern $file | \
    sed -e 's%^[ 	]*<td class="bgcolor left" colspan="17">%%' \
        -e 's%<img class="print_icon" src="screens\(/[^"]*\)" alt="[^"]*">%* [[file:svg\1]]%g' \
        -e 's%</span></td>$%%' \
        -e 's%<span class="tm [0-9A-Z_]*">%%g' \
        -e 's%</span>\*<span class="sup">[0-9]%%' \
        -e 's%</span>% -%' | \
    cat
