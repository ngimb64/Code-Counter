#!/bin/bash

# Example Usage:
# ./count_lines.sh /Path/To/Project .py .js .txt

# Function to count lines in specific file types
count_lines() {
    local directory=$1
    shift
    local extensions=("$@")

    # Initialize total line count
    total_lines=0

    printf "[+] Counting lines in %s\n\n" "$directory"

    # Traverse directory and subdirectories, find matching files
    for ext in "${extensions[@]}"; do
        # Find files with the specified extension and process them
        while read -r file; do
            # Count lines in each file and add to total
            file_lines=$(wc -l < "$file")
            total_lines=$((total_lines + file_lines))
            echo "$file - Lines: $file_lines"
        done < <(find "$directory" -type f -name "*$ext")
    done

    # Output the total line count
    printf "\n[!] Total lines across all specified file types: %s" "$total_lines"
}

# Call the function with the directory and the file extensions to search for
count_lines "$1" "${@:2}"
