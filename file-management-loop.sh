#!/bin/bash

# Loop through the files in the apollo directory
for file in /path/to/apollo/*
do
  # Check if the file is file1
  if [ "$file" = "/path/to/apollo/file1" ]; then
    # Delete file1
    rm "$file"
  elif [ "$file" = "/path/to/apollo/file2" ]; then
    # Give file2 execute permission
    chmod +x "$file"
  elif [ "$file" = "/path/to/apollo/file3" ]; then
    # Give file3 permission 777
    chmod 777 "$file"
  elif [ "$file" = "/path/to/apollo/file4" ]; then
    # Delete file4
    rm "$file"
  fi
done


# Notes 

# In this example, the "for" loop iterates through all the files in the "apollo" directory. For each file, 
# the script checks if it matches any of the four files you specified, and performs the corresponding action:
# If the file is "file1", it is deleted using the "rm" command.
# If the file is "file2", the execute permission is given using the "chmod" command.
# If the file is "file3", permission 777 is given using the "chmod" command.
# If the file is "file4", it is deleted using the "rm" command.
# You'll need to replace "/path/to/apollo" with the actual path to the "apollo" directory on your system.
