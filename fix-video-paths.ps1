# Move videos from old location to new location
$oldClipsDir = "assets/clips"
$newClipsDir = "src/assets/clips"

# Create new directory if it doesn't exist
New-Item -ItemType Directory -Path $newClipsDir -Force

# Move all video files
Get-ChildItem -Path $oldClipsDir -File | ForEach-Object {
    Move-Item -Path $_.FullName -Destination "$newClipsDir/$($_.Name)" -Force
}

# Update HTML files with video paths
$htmlFiles = Get-ChildItem -Path "*.html" -Recurse
foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Update video paths
    $content = $content -replace "src=""clips/", "src=""assets/clips/"
    $content = $content -replace "src=""assets/clips/", "src=""../assets/clips/"
    
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "Video paths have been fixed!" -ForegroundColor Green
