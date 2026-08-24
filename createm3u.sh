#!/bin/bash

# Nemo passes selected files as separate arguments via %F.

if [ "$#" -eq 0 ]; then
    notify-send "Create M3U" "No files were selected."
    exit 1
fi

# Directory containing the first selected file.
directory="$(dirname "$1")"

# Make sure all selected files are in the same directory.
for file in "$@"; do
    if [ "$(dirname "$file")" != "$directory" ]; then
        notify-send "Create M3U" \
            "All selected files must be in the same folder."
        exit 1
    fi
done

# Name the playlist after the containing folder.
folder_name="$(basename "$directory")"
m3u_file="$directory/$folder_name.m3u"

# Don't overwrite an existing playlist without asking.
if [ -e "$m3u_file" ]; then
    if ! zenity --question \
        --title="Create M3U Playlist" \
        --text="The playlist already exists:\n\n$m3u_file\n\nOverwrite it?" \
        --ok-label="Overwrite" \
        --cancel-label="Cancel"
    then
        exit 0
    fi
fi

# Write the selected filenames, sorted alphabetically.
for file in "$@"; do
    basename "$file"
done > "$m3u_file"

# Write filenames in the order supplied by Nemo.
for file in "$@"; do
    basename "$file"
done > "$m3u_file"

# Add the SAVEDISK directive as the final line.
echo "#SAVEDISK:" >> "$m3u_file"

notify-send "M3U Playlist Created" "$folder_name.m3u"
