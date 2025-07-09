#!/bin/sh

# Help function
show_help() {
   cat << EOF
Usage: $0 [OPTIONS] [PATH] [FORMAT]

Watch Mermaid files and auto-generate diagrams in browser.

Arguments:
 PATH      Directory to watch for .mmd files (default: current directory)
 FORMAT    Output format: svg, png, jpg, pdf, etc (default: svg)

Options:
 -h        Show this help message

Examples:
 $0                          # Watch current dir, output SVG
 $0 /path/to/files           # Watch specific dir, output SVG  
 $0 /path/to/files png       # Watch specific dir, output PNG
 $0 -h                       # Show help
EOF
}

# Parse help flag
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
   show_help
   exit 0
fi

# Parse arguments
watch_path=${1:-$(pwd)}
output_format=${2:-svg}

# Validate watch path
if [ ! -d "$watch_path" ]; then
   echo "Error: Directory '$watch_path' does not exist" >&2
   exit 1
fi

watch_path=$(realpath "$watch_path")

open_in_browser() {
    local file_path="$1"
    local abs_path=$(realpath "$file_path")

    if grep -qi microsoft /proc/version 2>/dev/null; then
        local winpath=$(wslpath -w "$file_path")
        printf "WSL location: %s" "$winpath"
    else
        xdg-open "$file_path" 2>/dev/null
    fi
}

echo "Watching: $watch_path"
echo "Output format: $output_format"

inotifywait -m \
 --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' \
 -e close_write --includei .mmd$ "$watch_path" |
while read -r date time dir file; do
      changed_abs=${dir}${file}
      changed_rel=${changed_abs#"$watch_path"/}
      output_file="$changed_abs.$output_format"

      if mmdc --theme default --iconPacks @iconify-json/logos -i "$changed_abs" -o "$output_file"; then
          echo "[${date} ${time}] $changed_rel -> $changed_rel.$output_format" >&2
          open_in_browser "$output_file"
      fi
done
