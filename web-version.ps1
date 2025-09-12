# Web-fetchable version of simalicious for Invoke-Expression demonstrations
# This is a simplified version designed to be fetched via IWR/Invoke-WebRequest

Write-Host "🚨 TRAINING SIMULATION EXECUTING 🚨" -ForegroundColor Red
Write-Host "Fetched and executed via Invoke-Expression pattern" -ForegroundColor Yellow

# Quick system info gathering (cross-platform)
Write-Host "`n[+] Reconnaissance..." -ForegroundColor Red
$computer = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { $env:HOSTNAME }
$user = if ($env:USERNAME) { $env:USERNAME } else { $env:USER }
Write-Host "    Target: $computer\$user" -ForegroundColor Gray

# Simulate file discovery
Write-Host "`n[+] Scanning for files..." -ForegroundColor Red
$count = Get-Random -Minimum 15 -Maximum 50
Write-Host "    Found $count files to encrypt" -ForegroundColor Yellow

# Fake encryption with progress
Write-Host "`n[+] Encrypting files..." -ForegroundColor Red
for ($i = 1; $i -le 10; $i++) {
    Write-Host "`r    Progress: $($i*10)%" -NoNewline -ForegroundColor Yellow
    Start-Sleep -Milliseconds 200
}

# Create ransom note
Write-Host "`n`n[+] Creating ransom demand..." -ForegroundColor Red
$note = @"
YOUR FILES ARE ENCRYPTED!
Send `$500 Bitcoin to recover your data.
This is a TRAINING SIMULATION - no actual harm done.
Generated: $(Get-Date)
"@

$notePath = if ($IsWindows) {
    Join-Path $env:TEMP "TRAINING_RANSOM_NOTE.txt"
} else {
    Join-Path "/tmp" "TRAINING_RANSOM_NOTE.txt"
}
$note | Out-File $notePath
Write-Host "    Ransom note: $notePath" -ForegroundColor Yellow

Write-Host "`n✅ SIMULATION COMPLETE" -ForegroundColor Green
Write-Host "This demonstrated a typical IEX-based attack pattern" -ForegroundColor Cyan
Write-Host "Remember: Never run unknown PowerShell commands!" -ForegroundColor Red