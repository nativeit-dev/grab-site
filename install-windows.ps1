# Windows installation script for grab-site
# This script works around build issues with html5-parser on Windows

Write-Host "Installing grab-site dependencies for Windows..." -ForegroundColor Green

# Set environment variable to skip cchardet
$env:GRAB_SITE_NO_CCHARDET = "1"

# Install grab-site without wpull first
Write-Host "`nInstalling grab-site (without wpull)..." -ForegroundColor Yellow
python -m pip install -e .

# Try to install wpull without dependencies
Write-Host "`nAttempting to install wpull (without html5-parser dependency)..." -ForegroundColor Yellow
python -m pip install --no-deps git+https://github.com/ArchiveTeam/ludios_wpull@3.0.9

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "`nNote: If wpull fails to install, you have two options:" -ForegroundColor Yellow
Write-Host "1. Use the Docker container (recommended)" -ForegroundColor White
Write-Host "2. Use WSL2 where all build tools are available" -ForegroundColor White
Write-Host "`nTo use Docker:" -ForegroundColor Yellow
Write-Host "  cd docker-grab-site" -ForegroundColor White
Write-Host "  docker build -t grab-site:dev ." -ForegroundColor White
Write-Host "  docker run -it -v `${PWD}/../:/workspace grab-site:dev bash" -ForegroundColor White
