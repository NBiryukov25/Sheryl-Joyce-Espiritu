$imageNames = @(
    'IMG_8591.PNG',
    'IMG_8593.PNG',
    'IMG_7405.PNG',
    'IMG_7408.PNG',
    'IMG_8604.PNG',
    'IMG_0103.JPG',
    'IMG_8562.PNG',
    'IMG_8605.PNG',
    'IMG_0102.PNG',
    'IMG0200.PNG',
    'IMG_9455.PNG',
    'IMG_9347.PNG',
    'IMG_9453.PNG',
    'IMG_9487.PNG',
    'IMG_0403.PNG'
)

# Search for each image file
foreach ($imageName in $imageNames) {
    Write-Host "Searching for: $imageName"
    Get-ChildItem -Path C:\ -Filter $imageName -Recurse -ErrorAction SilentlyContinue | Select-Object FullName
    Write-Host "----------------------------------------"
}
