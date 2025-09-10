# Example Usage:
# Get-LineCount -Directory "C:\Path\To\Project" -FileTypes @(".py", ".js", ".txt")

# Function to walk through the directory and count lines in specific file types
function Get-LineCount {
    param (
        [string]$Directory,
        [string[]]$FileTypes
    )

    $totalLineCount = 0

    # Check if directory exists
    if (-not (Test-Path $Directory)) {
        Write-Host "Directory does not exist: $Directory"
        return
    }

    Write-Host "[+] Counting files in $Directory`n"

    # Recursively get all files in the directory and its subdirectories
    $files = Get-ChildItem -Path $Directory -Recurse -File | Where-Object { $_.Extension -in $FileTypes }

    # Loop through each file and count lines
    foreach ($file in $files) {
        try {
            # Read entire file as a single string
            $text = Get-Content -Path $file.FullName -Raw -ErrorAction Stop

            # Split into lines, but skip the final empty one if its a trailing newline
            $lines = $text -split "`r?`n"
            if ($lines.Count -gt 0 -and $lines[-1] -eq '') {
                $lines = $lines[0..($lines.Count - 2)]
            }

            $lineCount = $lines.Count
            $totalLineCount += $lineCount

            Write-Host "$($file.FullName) - Lines: $lineCount"
        }
        catch {
            Write-Host "Could not read file: $($file.FullName)"
        }
    }

    # Return the total number of lines
    Write-Host "`n[!] Total lines across all specified file types: $totalLineCount"
}
