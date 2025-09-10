# Code Counter

- A set of scripts for counting the lines of source code and their sum in a Linux/Windows project based on file type with support for multiple file extensions

## Scripts

- `count_lines.sh` - Linux bash script
- `GetLineCount.psm1` - PowerShell script
- `linecount.bat` - Command Prompt script

## Usage

**count_lines.sh**
```
chmod +x count_lines.sh
```
```
./count_lines.sh /Path/To/Project .py .js .txt
```

**GetLineCount.psm1**
```
Import Module .\GetLineCount.psm1
```
```
Get-LineCount -Directory "C:\Path\To\Project" -FileTypes @(".py", ".js", ".txt")
```

**linecount.bat**
```
linecount.bat "/Path/To/Project" .py .js .txt
```
