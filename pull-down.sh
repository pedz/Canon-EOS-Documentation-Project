#!/opt/homebrew/bin/zsh

# Pulls down all the web content from Canon for the R1 and the R5 Mark
# II cameras.  Clearly others can be added.  No arguments.  Just run
# the script and all the pages to into cam.start.canon

# -m   - --mirror
# -k   - --convert-links
# -K   - --backup-converted
# -E   - --adjust-extension
# -l 7 - --level=depth
# -t 6 - --tries=number
# -w 2 - --wait=seconds
wget -m -k -K -E -l 7 -t 6 -w 2 -p \
     https://cam.start.canon/en/C017/manual/html/index.html \
     https://cam.start.canon/en/C017/manual/html/UG-00_Before_0010.html \
     https://cam.start.canon/en/C018/manual/html/index.html \
     https://cam.start.canon/en/C018/manual/html/UG-00_Before_0010.html
