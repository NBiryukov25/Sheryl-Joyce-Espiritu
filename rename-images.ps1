# Create a mapping of original filenames to new names
$imageMapping = @{
    'IMG_7405.PNG' = 'ptf_01.PNG'
    'IMG_7408.PNG' = 'ptf_02.PNG'
    'IMG_7400.PNG' = 'ptf_03.PNG'
    'IMG_7401.PNG' = 'ptf_04.PNG'
    'IMG_7403.PNG' = 'ptf_05.PNG'
    'IMG_7404.PNG' = 'ptf_06.PNG'
    'IMG_7407.PNG' = 'ptf_07.PNG'
    'IMG_7409.PNG' = 'ptf_08.PNG'
    'IMG_7468.PNG' = 'ptf_09.PNG'
    'IMG_7469.PNG' = 'ptf_10.PNG'
}

# Search for and copy the original files to assets/images folder
foreach ($originalName in $imageMapping.Keys) {
    $newName = $imageMapping[$originalName]
    
    # Search for the file in the backup enhanced directory
    $sourcePath = Join-Path -Path "C:\Users\rcrom\sheryl-joyce-espiritu - bkp\enhanced" -ChildPath $originalName
    
    if (Test-Path $sourcePath) {
        Write-Host "Found $originalName at $sourcePath"
        Copy-Item -Path $sourcePath -Destination "C:\Users\rcrom\sheryl-joyce-espiritu\assets\images\$newName" -Force
    } else {
        Write-Host "Could not find $originalName at $sourcePath"
    }
}
