# 🐾 StringHound – EXE/DLL String Extractor

A sleek Python-based utility to hunt down printable strings from `.exe` and `.dll` files using `strings.exe`. Whether you're reverse engineering, analyzing malware, or doing thick client assessments, **StringHound** helps you extract hidden insights buried inside binaries.

---

## ⚙️ Requirements

- Python
- `strings.exe` from Sysinternals  
  📥 [Download from Microsoft](https://learn.microsoft.com/en-us/sysinternals/downloads/strings)

Ensure `strings.exe` is in the **same directory** as `StringHound.py`.

---

## 🛠️ Usage

### 🔸 Extract from a single file

```bash
python StringHound.py -f "C:\Path\to\file.dll" -out "output_folder"
```

### 🔸 Extract from a folder (recursive)

```bash
python StringHound.py -d "C:\Path\to\directory" -out "output_folder"
```

---

## 📂 Output Format

The extracted string output will be saved in the output folder as `.txt` files.

Each file is named as:

```
original_filename.ext.txt
```

### ✅ Example Output Structure

```
📁 extracted/
├── cryptbase.dll.txt
├── notepad.exe.txt
└── tools.dll.txt
```

Each `.txt` file contains printable strings pulled from the corresponding binary using `strings.exe`.

---

## 🧪 Example Commands

```bash
# Extract strings from a single binary file
python StringHound.py -f "C:\Windows\System32\cryptbase.dll" -out "extracted"

# Extract strings from all .exe and .dll files in a folder (and its subfolders)
python StringHound.py -d "C:\Windows\System32" -out "extracted"
```

---

## 📖 Help Page

Use the `-h` flag to view available options and examples:

```bash
python StringHound.py -h
```

---

## ⚠️ Disclaimer

This tool is developed strictly for **educational**, **research**, and **internal testing** purposes.  
Use only on systems you own or have **explicit permission** to test.

> The author is not responsible for any misuse, illegal activities, or unintended consequences arising from the use of this tool.

---

## 🚀 Features

- Supports scanning **individual files** or **entire directories** (recursively)
- Filters and processes only `.exe` and `.dll` files
- Uses `strings.exe` to extract readable ASCII strings
- Automatically saves results as `<filename>.txt` in the specified output folder
- Fast, efficient, and ideal for large directory structures
- Includes a clean CLI interface with help and usage examples
