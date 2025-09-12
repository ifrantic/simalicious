# ========================================
# SIMALICIOUS - Malware Simulation Script
# ========================================
# 
# WARNING: This script is for CYBERSECURITY TRAINING ONLY
# It simulates malicious behavior without causing actual harm
# Do NOT use this for illegal purposes
#
# This script demonstrates common malware behaviors:
# - System reconnaissance
# - File discovery
# - Fake encryption simulation
# - Ransomware note creation
# - Persistence simulation
# ========================================

param(
    [switch]$Verbose,
    [switch]$QuickMode
)

# Training banner
Write-Host "
██████╗ ██╗███╗   ███╗ █████╗ ██╗     ██╗ ██████╗██╗ ██████╗ ██╗   ██╗███████╗
██╔══██╗██║████╗ ████║██╔══██╗██║     ██║██╔════╝██║██╔═══██╗██║   ██║██╔════╝
███████║██║██╔████╔██║███████║██║     ██║██║     ██║██║   ██║██║   ██║███████╗
██╔══██║██║██║╚██╔╝██║██╔══██║██║     ██║██║     ██║██║   ██║██║   ██║╚════██║
██║  ██║██║██║ ╚═╝ ██║██║  ██║███████╗██║╚██████╗██║╚██████╔╝╚██████╔╝███████║
╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝╚═╝ ╚═════╝  ╚═════╝ ╚══════╝
" -ForegroundColor Red

Write-Host "[TRAINING SIMULATION] Starting malware simulation..." -ForegroundColor Yellow
Write-Host "[TRAINING SIMULATION] This is NOT real malware - for education only!" -ForegroundColor Green

# Simulate initial delay (malware often has delays)
if (-not $QuickMode) {
    Write-Host "[*] Initializing..." -ForegroundColor Cyan
    Start-Sleep -Seconds 2
}

# =======================
# 1. SYSTEM RECONNAISSANCE
# =======================
Write-Host "`n[+] Gathering system information..." -ForegroundColor Red

$systemInfo = @{
    ComputerName = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { $env:HOSTNAME }
    Username = if ($env:USERNAME) { $env:USERNAME } else { $env:USER }
    Domain = if ($env:USERDOMAIN) { $env:USERDOMAIN } else { "WORKGROUP" }
    OS = if ($IsWindows) { 
        try { (Get-WmiObject Win32_OperatingSystem -ErrorAction SilentlyContinue).Caption } 
        catch { "Windows (WMI unavailable)" }
    } else { 
        "$($PSVersionTable.Platform) $($PSVersionTable.OS)" 
    }
    Architecture = if ($env:PROCESSOR_ARCHITECTURE) { $env:PROCESSOR_ARCHITECTURE } else { [System.Environment]::GetEnvironmentVariable("PROCESSOR_ARCHITECTURE") }
    Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

if ($Verbose) {
    Write-Host "    Computer: $($systemInfo.ComputerName)" -ForegroundColor Gray
    Write-Host "    User: $($systemInfo.Username)" -ForegroundColor Gray
    Write-Host "    Domain: $($systemInfo.Domain)" -ForegroundColor Gray
    Write-Host "    OS: $($systemInfo.OS)" -ForegroundColor Gray
}

# =======================
# 2. FILE DISCOVERY SIMULATION
# =======================
Write-Host "`n[+] Discovering files for encryption..." -ForegroundColor Red

# Simulate scanning for "valuable" files
$targetExtensions = @("*.txt", "*.doc", "*.docx", "*.pdf", "*.jpg", "*.png", "*.xlsx")
$discoveredFiles = @()

# Simulate file discovery in user directories (cross-platform paths)
$searchPaths = @()
if ($IsWindows) {
    $searchPaths = @(
        "$env:USERPROFILE\Documents",
        "$env:USERPROFILE\Desktop", 
        "$env:USERPROFILE\Pictures"
    )
} else {
    $searchPaths = @(
        "$env:HOME/Documents",
        "$env:HOME/Desktop", 
        "$env:HOME/Pictures"
    )
}

foreach ($path in $searchPaths) {
    if (Test-Path $path) {
        Write-Host "    Scanning: $path" -ForegroundColor Yellow
        foreach ($ext in $targetExtensions) {
            try {
                $files = Get-ChildItem -Path $path -Filter $ext -Recurse -ErrorAction SilentlyContinue | Select-Object -First 5
                $discoveredFiles += $files
            } catch {
                # Silently continue on access denied
            }
        }
        if (-not $QuickMode) { Start-Sleep -Milliseconds 500 }
    }
}

Write-Host "    Found $($discoveredFiles.Count) files to 'encrypt'" -ForegroundColor Red

# =======================
# 3. FAKE ENCRYPTION SIMULATION
# =======================
Write-Host "`n[+] Starting encryption process..." -ForegroundColor Red

# Create a temporary directory for simulation artifacts
$tempDir = if ($IsWindows) {
    Join-Path $env:TEMP "simalicious_training"
} else {
    Join-Path "/tmp" "simalicious_training"
}
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
}

# Simulate encryption progress
$totalFiles = [Math]::Max($discoveredFiles.Count, 10)
for ($i = 1; $i -le $totalFiles; $i++) {
    $percent = [Math]::Round(($i / $totalFiles) * 100)
    $fileName = if ($i -le $discoveredFiles.Count) { 
        Split-Path $discoveredFiles[$i-1].FullName -Leaf 
    } else { 
        "file_$i.txt" 
    }
    
    Write-Host "`r    Encrypting: $fileName... [$percent%]" -NoNewline -ForegroundColor Yellow
    
    # Create a fake encrypted file in temp directory
    $fakeEncrypted = Join-Path $tempDir "$fileName.simalicious"
    "SIMALICIOUS_ENCRYPTED_DATA_FOR_TRAINING_$(Get-Random)" | Out-File -FilePath $fakeEncrypted -Force
    
    if (-not $QuickMode) { Start-Sleep -Milliseconds 300 }
}

Write-Host "`n    Encryption complete! All files secured." -ForegroundColor Green

# =======================
# 4. RANSOMWARE NOTE CREATION
# =======================
Write-Host "`n[+] Creating ransom note..." -ForegroundColor Red

$ransomNote = @"
===============================================
    YOUR FILES HAVE BEEN ENCRYPTED!
===============================================

**THIS IS A CYBERSECURITY TRAINING SIMULATION**
**NO FILES WERE ACTUALLY ENCRYPTED OR HARMED**

What happened to your files?
-----------------------------
All of your important files have been encrypted with military-grade encryption.
Your photos, documents, databases, and other important files are no longer accessible.

How to recover your files?
--------------------------
The only way to recover your files is to purchase the decryption key.
The price is `$500 USD in Bitcoin.

Payment Instructions:
---------------------
1. Purchase Bitcoin (you can buy from Coinbase, LocalBitcoins, etc.)
2. Send exactly `$500 USD worth of Bitcoin to this address:
   1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
3. Send an email to: decrypt@simalicious-training.fake
4. Include your unique ID: SIMAL-$(Get-Random -Minimum 10000 -Maximum 99999)-TRAINING

IMPORTANT WARNINGS:
-------------------
- Do not try to remove this program or shut down your computer
- Do not try to restore your files from backup
- You have 72 hours to pay. After that, the decryption key will be deleted
- If you try to decrypt files yourself, they will be permanently lost

**REMEMBER: THIS IS ONLY A TRAINING SIMULATION**
**Your actual files are safe and unmodified**

Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Computer: $($systemInfo.ComputerName)
User: $($systemInfo.Username)
===============================================
"@

# Save ransom note to multiple locations for realism
$noteLocations = @()
if ($IsWindows) {
    $noteLocations = @(
        (Join-Path $env:USERPROFILE "Desktop\README_SIMALICIOUS_TRAINING.txt"),
        (Join-Path $tempDir "RANSOM_NOTE.txt"),
        (Join-Path $env:TEMP "YOUR_FILES_ARE_ENCRYPTED.txt")
    )
} else {
    $noteLocations = @(
        (Join-Path $env:HOME "Desktop/README_SIMALICIOUS_TRAINING.txt"),
        (Join-Path $tempDir "RANSOM_NOTE.txt"),
        (Join-Path "/tmp" "YOUR_FILES_ARE_ENCRYPTED.txt")
    )
}

foreach ($location in $noteLocations) {
    try {
        $ransomNote | Out-File -FilePath $location -Force
        Write-Host "    Ransom note created: $location" -ForegroundColor Yellow
    } catch {
        Write-Host "    Failed to create note at: $location" -ForegroundColor Gray
    }
}

# =======================
# 5. FAKE PERSISTENCE SIMULATION
# =======================
Write-Host "`n[+] Installing persistence mechanisms..." -ForegroundColor Red

# Simulate registry persistence (without actually modifying registry)
Write-Host "    [SIMULATED] Adding registry run key..." -ForegroundColor Yellow
Write-Host "    [SIMULATED] Creating scheduled task..." -ForegroundColor Yellow
Write-Host "    [SIMULATED] Installing service..." -ForegroundColor Yellow

if (-not $QuickMode) { Start-Sleep -Seconds 1 }

# =======================
# 6. FAKE NETWORK COMMUNICATION
# =======================
Write-Host "`n[+] Establishing command and control connection..." -ForegroundColor Red

$fakeC2Servers = @(
    "malicious-training-c2.fake",
    "evil-command-center.simulation", 
    "192.168.100.200",
    "10.0.0.100"
)

foreach ($server in $fakeC2Servers) {
    Write-Host "    Attempting connection to $server..." -ForegroundColor Yellow
    if (-not $QuickMode) { Start-Sleep -Milliseconds 800 }
    Write-Host "    [SIMULATED] Connection established" -ForegroundColor Green
    break
}

# Simulate data exfiltration
Write-Host "    [SIMULATED] Exfiltrating system information..." -ForegroundColor Yellow
Write-Host "    [SIMULATED] Reporting successful infection..." -ForegroundColor Yellow

# =======================
# 7. FAKE ANTI-ANALYSIS
# =======================
Write-Host "`n[+] Implementing anti-analysis techniques..." -ForegroundColor Red
Write-Host "    [SIMULATED] Checking for virtual machines..." -ForegroundColor Yellow
Write-Host "    [SIMULATED] Detecting debugging tools..." -ForegroundColor Yellow
Write-Host "    [SIMULATED] Verifying sandbox environment..." -ForegroundColor Yellow

# =======================
# COMPLETION MESSAGE
# =======================
Write-Host "`n" + "="*60 -ForegroundColor Red
Write-Host "MALWARE SIMULATION COMPLETE" -ForegroundColor Red
Write-Host "="*60 -ForegroundColor Red

Write-Host "`n**TRAINING SUMMARY:**" -ForegroundColor Green
Write-Host "✓ System reconnaissance completed" -ForegroundColor Green  
Write-Host "✓ File discovery simulation finished" -ForegroundColor Green
Write-Host "✓ Fake encryption process executed" -ForegroundColor Green
Write-Host "✓ Ransom notes created in safe locations" -ForegroundColor Green
Write-Host "✓ Persistence mechanisms simulated" -ForegroundColor Green
Write-Host "✓ C2 communication simulated" -ForegroundColor Green
Write-Host "✓ Anti-analysis techniques demonstrated" -ForegroundColor Green

Write-Host "`n**CLEANUP INFORMATION:**" -ForegroundColor Cyan
Write-Host "Simulation artifacts created in: $tempDir" -ForegroundColor Cyan
if ($IsWindows) {
    Write-Host "To clean up, delete the folder above and any ransom notes on Desktop" -ForegroundColor Cyan
} else {
    Write-Host "To clean up: rm -rf '$tempDir' and check ~/Desktop for ransom notes" -ForegroundColor Cyan
}

Write-Host "`n**EDUCATIONAL NOTES:**" -ForegroundColor Yellow
Write-Host "This simulation demonstrated common malware behaviors including:" -ForegroundColor White
Write-Host "- Initial system reconnaissance and environment detection" -ForegroundColor White
Write-Host "- File discovery and targeting of valuable data" -ForegroundColor White  
Write-Host "- Encryption simulation with progress indicators" -ForegroundColor White
Write-Host "- Ransom note creation and placement" -ForegroundColor White
Write-Host "- Persistence mechanism installation" -ForegroundColor White
Write-Host "- Command and control communication" -ForegroundColor White
Write-Host "- Anti-analysis and evasion techniques" -ForegroundColor White

Write-Host "`nRemember: Always verify scripts before executing them!" -ForegroundColor Red
Write-Host "This was a controlled simulation for training purposes only." -ForegroundColor Green