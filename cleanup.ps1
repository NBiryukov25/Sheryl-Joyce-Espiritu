# Clean up old files and directories
$oldFiles = @(
    "css/lightbox.css",
    "js/gallery.js",
    "js/photo-config.js",
    "js/include-html.js",
    "assets/js/lightbox.js",
    "assets/js/photo-config.js",
    "assets/js/cdn.js"
)

foreach ($file in $oldFiles) {
    if (Test-Path $file) {
        Remove-Item -Path $file -Force
        Write-Host "Removed $file" -ForegroundColor Green
    }
}

$oldDirs = @(
    "css",
    "js",
    "assets/css",
    "assets/js"
)

foreach ($dir in $oldDirs) {
    if (Test-Path $dir) {
        Remove-Item -Path $dir -Recurse -Force
        Write-Host "Removed directory $dir" -ForegroundColor Green
    }
}
