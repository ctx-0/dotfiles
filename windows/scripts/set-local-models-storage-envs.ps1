# Idempotent environment setup for AI model paths

$ErrorActionPreference = "Stop"

# Base directory for all AI models
$aiRoot = "D:\models"

$paths = @{
    HF_HOME = "$aiRoot\huggingface"
    HUGGINGFACE_HUB_CACHE = "$aiRoot\huggingface\hub" # Legacy: Redundant if HF_HOME is set
    TRANSFORMERS_CACHE = "$aiRoot\huggingface" # Legacy: old transformers library versions

    OLLAMA_MODELS = "$aiRoot\ollama\models"
}

Write-Host "Configuring AI model environment variables..." -ForegroundColor Blue

# Create directories if missing
foreach ($path in $paths.Values) {
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Force -Path $path | Out-Null
        Write-Host "  Created: $path" -ForegroundColor DarkGray
    }
}

# Idempotent setx: only update if different or missing
foreach ($var in $paths.GetEnumerator()) {
    $current = [Environment]::GetEnvironmentVariable($var.Key, "User")

    if ($current -ne $var.Value) {
        Write-Host "→ Setting $var.Key" -ForegroundColor Cyan
        [Environment]::SetEnvironmentVariable($var.Key, $var.Value, "User")
    } else {
        Write-Host "  ✓ $var.Key already set" -ForegroundColor DarkGray
    }
}

Write-Host "`n✅ Done. Restart your terminal to apply changes." -ForegroundColor Green
Write-Host "   Note: Ollama service requires restart to pick up new path" -ForegroundColor Yellow
