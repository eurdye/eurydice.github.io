#!/bin/bash

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "Error: pandoc is not installed. Please install it to use this script."
    exit 1
fi

echo "Converting Markdown files (.md or .markdown) in the current directory to HTML..."

# Loop through all files in the current directory
for file in *; do
    # Check if it's a regular file
    if [ -f "$file" ]; then
        # Check if the file has a .md or .markdown extension
        if [[ "$file" == *.md || "$file" == *.markdown ]]; then
            # Extract the filename without its extension
            filename_no_ext="${file%.*}"
            # Define the output HTML file name
            output_file="${filename_no_ext}.html"

            echo "Converting '$file' to '$output_file'..."
            # pandoc "$file" -s --css=sakura.css -o "$output_file"
            pandoc "$file" -s --lua-filter=modify-images.lua --template=template.html -o "$output_file"

            if [ $? -eq 0 ]; then
                echo "Successfully converted '$file'."
            else
                echo "Error converting '$file'."
            fi
        fi
    fi
done

echo "Conversion process complete."
