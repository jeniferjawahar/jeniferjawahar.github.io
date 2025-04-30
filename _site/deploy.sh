#!/bin/bash

# Define the branch name
BRANCH="gh-pages"

# Ensure you're on the main branch and pull latest changes
echo "Switching to master branch..."
git checkout master
git pull origin master

# Build the site with Jekyll
echo "Building the site with Jekyll..."
bundle exec jekyll build

# Switch to gh-pages branch
echo "Switching to the $BRANCH branch..."
git checkout $BRANCH

# Add the generated site files to the gh-pages branch
echo "Adding the generated site files to $BRANCH..."
git add _site/*

# Commit the changes
echo "Committing the changes..."
git commit -m "Update site: $(date +'%Y-%m-%d %H:%M:%S')"

# Push the changes to GitHub
echo "Pushing changes to $BRANCH branch..."
git push origin $BRANCH

# Return to the main branch
echo "Switching back to main branch..."
git checkout main

echo "Deployment successful!"
