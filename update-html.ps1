# Update HTML files to use new CSS structure
$files = Get-ChildItem -Path "*.html" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Update CSS links
    $content = $content -replace "<link rel=""stylesheet"" href=""css/lightbox.css"">", "<link rel=""stylesheet"" href=""dist/css/main.css"">"
    
    # Update JavaScript links
    $content = $content -replace "<script src=""js/gallery.js""></script>", "<script src=""dist/js/gallery.js""></script>"
    $content = $content -replace "<script src=""js/photo-config.js""></script>", "<script src=""dist/js/photo-config.js""></script>"
    $content = $content -replace "<script src=""js/include-html.js""></script>", "<script src=""dist/js/include-html.js""></script>"
    
    # Update image paths
    $content = $content -replace "src=""images/", "src=""assets/images/"
    
    # Save updated content
    Set-Content -Path $file.FullName -Value $content
    Write-Host "Updated $file.FullName" -ForegroundColor Green
}
