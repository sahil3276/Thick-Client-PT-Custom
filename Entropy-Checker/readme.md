# 🔍 Entropy Scanner for EXE/DLL Files

A lightweight PowerShell script to scan `.exe` and `.dll` files for entropy, helping identify packed or obfuscated binaries. Supports scanning individual files or entire directories (recursively).

## 🚀 Features

- Calculates file entropy (useful for malware/packer detection)
- Scans all `.exe` and `.dll` files in a folder
- Skips large files (>100MB) to avoid freezing
- Displays clean tabular output
- Shows real-time progress during directory scan

## 🛠️ Usage

### 🔸 Scan a single file
```powershell
& "entropy.ps1" -File "C:\Path\to\file.dll"
```
![image](https://github.com/user-attachments/assets/5a55b056-4a40-47a2-9c2e-c0cc00e12326)


### 🔸 Scan an entire directory (recursive)
```powershell
& "entropy.ps1" -Directory "C:\Path\to\folder"
```
![image](https://github.com/user-attachments/assets/f10a40f5-7f07-4720-bce7-779013e2c18f)

## 📋 Output Example

```
File Path                                Entropy
---------                                -------
C:\Test\sample.dll                       6.7321
C:\Test\packed.exe                       7.9962
C:\Test\huge.exe                         Skipped (>120.5MB)
```

## ⚠️ Disclaimer

This script is for educational and internal testing purposes only. Use at your own risk.  
The entropy score alone does not confirm malicious intent — always analyze further.
