# DLL Scanner PowerShell Tool

A lightweight PowerShell script to recursively scan directories and extract developer/publisher information from DLL files.

## 📋 Requirements

- Windows PowerShell (built-in on Windows)
- No additional dependencies required

### Basic Command
```powershell
powershell -ExecutionPolicy Bypass -File "Dll_Scanner.ps1" "Folder-Path"
```

### Examples

**Scan Program Files:**
```powershell
powershell -ExecutionPolicy Bypass -File "Dll_Scanner.ps1" "C:\\Program Files\\MyApplication"
```

**Scan System32 Directory:**
```powershell
powershell -ExecutionPolicy Bypass -File "Dll_Scanner.ps1" "C:\\Windows\\System32"
```

**Scan Current Directory:**
```powershell
powershell -ExecutionPolicy Bypass -File "Dll_Scanner.ps1" "."
```

![Dll_Scanner](https://github.com/user-attachments/assets/b9c62c66-c5d9-4bb6-9879-2062bdf7aa8d)

## 📊 Sample Output

```
Scanning DLLs in: C:\\Program Files\\MyApp

DLL Name                                 Developer
------------------------------------------------------------------------------------------
kernel32.dll                            Microsoft Corporation
user32.dll                              Microsoft Corporation
custom_library.dll                      Unknown
third_party.dll                         Adobe Systems Incorporated
myapp_core.dll                          MyCompany Inc.

Total DLLs found: 5
```



## 🚀 Features

- **Recursive Directory Scanning** - Automatically searches through all subdirectories
- **Developer Identification** - Extracts company/publisher information from DLL metadata
- **Color-Coded Output** - Visual distinction between known, unknown, and Microsoft DLLs
- **Error Handling** - Gracefully handles corrupted or inaccessible DLL files
- **No Dependencies** - Uses built-in Windows PowerShell capabilities
- **Fast Execution** - Optimized for quick scanning of large directory structures


## 🛠️ Troubleshooting

### Execution Policy Error [If you're searching in the System directory, make sure to open PowerShell with administrative privileges.]
If you encounter execution policy restrictions:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Alternative Execution Methods

**Method 1 - Using & operator:**
```powershell
& ".\\Dll_Scanner.ps1" "C:\\Your\\Path"
```

**Method 2 - Navigate to script directory:**
```powershell
cd "C:\\Path\\To\\Script"
.\\Dll_Scanner.ps1 "C:\\Target\\Directory"
```

**Method 3 - Interactive mode:**
Simply double-click the script file and enter the path when prompted.



## 📁 Use Cases

- **Security Audits** - Identify unknown or suspicious DLL files
- **Software Analysis** - Understand third-party dependencies
- **System Cleanup** - Find orphaned or outdated libraries
- **Compliance Checks** - Verify software publishers and licenses
- **Malware Detection** - Spot unsigned or unknown DLLs




## Output Information

For each DLL file, the tool extracts:
- **File Name** - The DLL filename
- **Developer/Publisher** - Company name from file version info

**Quick Start:** \`powershell -ExecutionPolicy Bypass -File "Dll_Scanner.ps1" "C:\\Your\\Target\\Directory"\`
