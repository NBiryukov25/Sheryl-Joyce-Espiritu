# Organize assets into appropriate directories
$sourceDirs = @(
    "assets/images",
    "assets/audio",
    "assets/clips"
)

foreach ($dir in $sourceDirs) {
    if (Test-Path $dir) {
        $files = Get-ChildItem -Path $dir -File
        foreach ($file in $files) {
            $newPath = Join-Path "src/assets" $file.FullName.Substring($dir.Length)
            $newDir = Split-Path $newPath -Parent
            
            # Create directory if it doesn't exist
            if (-not (Test-Path $newDir)) {
                New-Item -ItemType Directory -Path $newDir -Force
            }
            
            # Move file
            Move-Item -Path $file.FullName -Destination $newPath -Force
            Write-Host "Moved $($file.FullName) to $newPath" -ForegroundColor Green
        }
    }
}

# Update photo-config.js paths
$photoConfigPath = "src/config/photo-config.js"
if (Test-Path $photoConfigPath) {
    $content = Get-Content $photoConfigPath -Raw
    $content = $content -replace "src: 'images/", "src: 'assets/images/"
    Set-Content -Path $photoConfigPath -Value $content
    Write-Host "Updated photo-config.js paths" -ForegroundColor Green
}
