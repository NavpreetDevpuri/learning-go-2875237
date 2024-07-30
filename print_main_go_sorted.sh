#!/bin/bash

# Fetch all branches from the remote
git fetch --all

# Get a list of all branches and sort them
branches=$(git branch -r | grep -v '\->' | sed 's|origin/||' | sort)

# Loop through each sorted branch
for branch in $branches; do
    # Check out the branch
    git checkout $branch

    # Print the branch name
    echo "Branch: $branch"

    # Check if the file exists and print its contents
    if [[ -f practice/main.go ]]; then
        echo "Contents of practice/main.go:"
        cat practice/main.go
    else
        echo "practice/main.go does not exist in this branch."
    fi

    echo ""
done

# Check out back to the main branch (or any default branch you prefer)
git checkout main
