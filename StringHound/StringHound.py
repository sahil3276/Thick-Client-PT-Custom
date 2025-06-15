import argparse
import os
import subprocess
from pathlib import Path

def run_strings_on_file(file_path, output_dir, strings_exe_path="strings.exe"):
    output_file = output_dir / f"{file_path.name}.txt"
    try:
        result = subprocess.run(
            [strings_exe_path, str(file_path)],
            capture_output=True,
            text=True
        )
        output_file.write_text(result.stdout, encoding='utf-8', errors='ignore')
        print(f"[+] Saved: {output_file}")
    except Exception as e:
        print(f"[-] Error processing {file_path}: {e}")

def main():
    parser = argparse.ArgumentParser(
        description="Extract strings from .exe or .dll files using strings.exe.\n"
                    "Scans folders recursively including subdirectories.",
        formatter_class=argparse.RawTextHelpFormatter,
        epilog="Example usage:\n"
               "  python strings_extractor.py -f sample.exe -out output_folder\n"
               "  python strings_extractor.py -d C:\\FolderPath -out results"
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("-f", "--file", help="Path to a single .exe or .dll file")
    group.add_argument("-d", "--directory", help="Path to a folder (recursive scan)")

    parser.add_argument("-out", "--output", required=True, help="Output directory to save .txt files")
    args = parser.parse_args()

    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    if args.file:
        file_path = Path(args.file)
        if file_path.suffix.lower() in ['.exe', '.dll'] and file_path.exists():
            run_strings_on_file(file_path, output_dir)
        else:
            print("[-] Provided file is not a .exe or .dll or doesn't exist.")
    elif args.directory:
        dir_path = Path(args.directory)
        if not dir_path.exists():
            print("[-] Provided directory does not exist.")
            return

        for root, _, files in os.walk(dir_path):
            for file in files:
                if file.lower().endswith((".exe", ".dll")):
                    full_path = Path(root) / file
                    run_strings_on_file(full_path, output_dir)

if __name__ == "__main__":
    main()
