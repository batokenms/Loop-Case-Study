#!/bin/bash

# Create an array of 10 fruits
fruits=("apple" "banana" "mango" "orange" "pineapple" "grape" "pear" "kiwi" "watermelon" "peach")

# Loop through the array to find the mango fruit
for fruit in "${fruits[@]}"
do
    if [ "$fruit" = "mango" ]
    then
        echo "Found the mango fruit!"
        break
    fi
done
