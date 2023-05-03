#!/bin/bash

# Define an array of ten fruits
fruits=("apple" "banana" "cherry" "date" "elderberry" "fig" "grape" "honeydew" "kiwi" "lemon")

# Iterate over the fruits array using a for loop
for fruit in "${fruits[@]}"
do
  # Print a message for each fruit
  echo "I like $fruit"
done

# Prompt the user to select one fruit
echo "Please select one fruit: "

# Read the user input
read selected_fruit

# Print the selected fruit
echo "You selected $selected_fruit"
