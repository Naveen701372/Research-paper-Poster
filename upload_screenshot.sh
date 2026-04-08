#!/bin/bash
# Screenshot Upload Script for GitHub Pages

# Function to take screenshot and upload to GitHub
upload_screenshot() {
    local filename="screenshot_$(date +%Y%m%d_%H%M%S).png"
    local filepath="/Users/navi/Research-paper-Poster/screenshots/$filename"
    
    # Take screenshot
    screencapture -i "$filepath"
    
    if [ -f "$filepath" ]; then
        cd "/Users/navi/Research-paper-Poster"
        git add "screenshots/$filename"
        git commit -m "Add screenshot: $filename"
        git push origin main
        
        # Return the GitHub Pages URL
        echo "Screenshot uploaded! Link: https://naveen701372.github.io/Research-paper-Poster/screenshots/$filename"
    else
        echo "Screenshot cancelled or failed"
    fi
}

# Run the function
upload_screenshot