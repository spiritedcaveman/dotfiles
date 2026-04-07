#!/bin/bash
# Read 4 lines from rescrobbled
read -r artist
read -r title
read -r album
read -r genre

# 1. Skip if no album (Your 'No Garbage' Rule)
[[ -z "$album" ]] && exit 0

# 2. THE CHOP: Delete everything up to the LAST " - "
# This handles "DECAYED - Pagan Winds" -> "Pagan Winds"
# And handles "DECAYED - DECAYED - Pagan Winds" -> "Pagan Winds"
if [[ "$title" == *" - "* ]]; then
    clean_title="${title##* - }"
else
    clean_title="$title"
fi

# 3. Output the 3 required lines
echo "$artist"
echo "$clean_title"
echo "$album"
