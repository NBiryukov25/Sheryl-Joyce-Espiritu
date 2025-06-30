# Move images from old location to new location
$oldImagesDir = "assets/images"
$newImagesDir = "src/assets/images"

# Create new directories if they don't exist
New-Item -ItemType Directory -Path $newImagesDir -Force
New-Item -ItemType Directory -Path "$newImagesDir/personal" -Force
New-Item -ItemType Directory -Path "$newImagesDir/dossier" -Force

# Move carousel images
$carouselImages = Get-ChildItem -Path $oldImagesDir -Filter "p*.png" -File
foreach ($img in $carouselImages) {
    Move-Item -Path $img.FullName -Destination "$newImagesDir/$($img.Name)" -Force
}

# Move personal images
$personalImages = Get-ChildItem -Path $oldImagesDir -Filter "personal_*" -File
foreach ($img in $personalImages) {
    Move-Item -Path $img.FullName -Destination "$newImagesDir/personal/$($img.Name)" -Force
}

# Move dossier images
$dossierImages = Get-ChildItem -Path $oldImagesDir -Filter "dossier_*" -File
foreach ($img in $dossierImages) {
    Move-Item -Path $img.FullName -Destination "$newImagesDir/dossier/$($img.Name)" -Force
}

# Update photo-config.js paths
$photoConfigPath = "src/config/photo-config.js"
$content = Get-Content $photoConfigPath -Raw

# Update carousel directory
$content = $content -replace "directory: 'assets/images/'", "directory: '../assets/images/'"

# Update personal directory
$content = $content -replace "directory: 'assets/images/personal/'", "directory: '../assets/images/personal/'"

# Update dossier directory
$content = $content -replace "directory: 'assets/images/dossier/'", "directory: '../assets/images/dossier/'"

Set-Content -Path $photoConfigPath -Value $content

# Update HTML files
$htmlFiles = Get-ChildItem -Path "*.html" -Recurse
foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Update image paths
    $content = $content -replace "src=""images/", "src=""assets/images/"
    $content = $content -replace "src=""assets/images/", "src=""../assets/images/"
    
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "Image paths have been fixed!" -ForegroundColor Green
