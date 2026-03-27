#!/bin/bash
read -r artist
read -r title
read -r album
read -r genre

# --- NEW: ABORT IF NO ALBUM ---
# If the album string is empty, we exit 1 to stop rescrobbled from scrobbling.
if [[ -z "$album" ]]; then
    echo "DEBUG: Skipping $title - No album info found" >&2
    exit 1
fi

# --- EXISTING LOGIC ---
echo "DEBUG: Filtering $artist - $title" >&2

clean_title=$(echo "$title" | sed "s/^$artist - //")

echo "$artist"
echo "$clean_title"
echo "$album"
