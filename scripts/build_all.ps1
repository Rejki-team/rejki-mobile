# Build All Script for Rejki Monorepo
# This script runs build_runner in the correct dependency order
# Usage: ./scripts/build_all.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rejki Monorepo Build Runner Script   " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Build core
Write-Host "[1/5] Building core package..." -ForegroundColor Yellow
melos run build:core
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to build core package!" -ForegroundColor Red
    exit 1
}
Write-Host "[1/5] Core build complete!" -ForegroundColor Green
Write-Host ""

# Step 2: Build domain
Write-Host "[2/5] Building domain package..." -ForegroundColor Yellow
melos run build:domain
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to build domain package!" -ForegroundColor Red
    exit 1
}
Write-Host "[2/5] Domain build complete!" -ForegroundColor Green
Write-Host ""

# Step 3: Build data
Write-Host "[3/5] Building data package..." -ForegroundColor Yellow
melos run build:data
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to build data package!" -ForegroundColor Red
    exit 1
}
Write-Host "[3/5] Data build complete!" -ForegroundColor Green
Write-Host ""

# Step 4: Build features (parallel)
Write-Host "[4/5] Building feature packages (parallel)..." -ForegroundColor Yellow
melos run build:features
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to build feature packages!" -ForegroundColor Red
    exit 1
}
Write-Host "[4/5] Features build complete!" -ForegroundColor Green
Write-Host ""

# Step 5: Build di
Write-Host "[5/5] Building DI package..." -ForegroundColor Yellow
melos run build:di
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to build DI package!" -ForegroundColor Red
    exit 1
}
Write-Host "[5/5] DI build complete!" -ForegroundColor Green
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "  All builds completed successfully!   " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
