#! /usr/bin/bash

silent() {
  "$@" &> /dev/null 
}

cdls() {
  local dir="$1"

  if [ -z "$dir" ]; then 
    builtin cd
  elif [ -d "$dir" ]; then
    builtin cd "$dir"
  else
    local match
    match=$(compgen -d "$dir" | head -1)
    if [ -n "$match" ]; then
      echo "Autocompleted '$dir' to '$match'."
      builtin cd "$match"
    else
      echo "No match found for '$dir'."
    fi
  fi
}


# Function to open a local HTML file in a new Brave app window on Wayland
# Usage: bravefile <path/to/file.html>
bravefile() {
  if [ -z "$1" ]; then
    echo "Error: Please provide a file path."
    echo "Usage: bravefile <path/to/file.html>"
    return 1
  fi

  # Get the absolute, real path to the file
  # This handles relative paths like "./index.html" or tildes like "~/docs/page.html"
  ABSOLUTE_PATH=$(realpath "$1")

  # Check if the file actually exists
  if [ ! -f "$ABSOLUTE_PATH" ]; then
    echo "Error: File not found at '$ABSOLUTE_PATH'"
    return 1
  fi

  # URI-encode the path, keeping slashes safe
  ENCODED_PATH=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$ABSOLUTE_PATH")

  # Execute the brave command
  echo "Opening: file://$ENCODED_PATH"
  brave --new-window --ozone-platform=wayland --app="file://$ENCODED_PATH"
}
