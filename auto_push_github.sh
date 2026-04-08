#!/bin/bash

# Automated GitHub Push Script for Research-paper-Poster
# Created by Navi for screenshot uploads and general repo updates
# Location: ~/Research-paper-Poster/auto_push_github.sh

echo "🚀 Starting automated GitHub push..."

# Navigate to repo directory
cd ~/Research-paper-Poster

# Check if we're in a git repo
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

# Show current status
echo "📊 Current git status:"
git status --short

# Add all changes
echo "➕ Adding all changes..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "✅ No changes to commit - repository is up to date"
    exit 0
fi

# Create commit with timestamp
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
COMMIT_MSG="Auto-update: Screenshot and file sync - $TIMESTAMP"

echo "💾 Committing changes: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Push to GitHub
echo "🔄 Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo "🔗 View at: https://github.com/Naveen701372/Research-paper-Poster"
    echo "📸 Screenshots at: https://naveen701372.github.io/Research-paper-Poster/screenshots/"
else
    echo "❌ Push failed - check your internet connection and GitHub auth"
    exit 1
fi