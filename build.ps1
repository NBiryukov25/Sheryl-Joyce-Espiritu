# Build script for Sheryl Joyce Espiritu's website

# Create dist directory if it doesn't exist
if (-not (Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist"
}

# Copy assets
Copy-Item -Path "src/assets/*" -Destination "dist/assets" -Recurse -Force

# Compile CSS
if (Test-Path "node_modules") {
    npm run build:css
}

# Compile JavaScript
if (Test-Path "node_modules") {
    npm run build:js
}

# Copy HTML files
Copy-Item -Path "src/templates/*.html" -Destination "dist" -Force

Write-Host "Build completed successfully!" -ForegroundColor Green
