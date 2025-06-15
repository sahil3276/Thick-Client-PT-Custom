param(
    [string]$File,
    [string]$Directory
)

Function Get-Entropy {
    param ([byte[]]$Bytes)
    if ($Bytes.Length -eq 0) { return 0 }

    $counts = @(0) * 256
    foreach ($b in $Bytes) { $counts[$b]++ }

    $entropy = 0.0
    foreach ($count in $counts) {
        if ($count -ne 0) {
            $p = $count / $Bytes.Length
            $entropy -= $p * [Math]::Log($p, 2)
        }
    }
    return [Math]::Round($entropy, 4)
}

Function Scan-File {
    param ($Path)
    try {
        $sizeMB = (Get-Item $Path).Length / 1MB
        if ($sizeMB -gt 100) {
            return [PSCustomObject]@{
                "File Path" = $Path
                "Entropy"   = "Skipped (>$($sizeMB.ToString("F1"))MB)"
            }
        }

        $bytes = [System.IO.File]::ReadAllBytes($Path)
        $entropy = Get-Entropy $bytes
        return [PSCustomObject]@{
            "File Path" = $Path
            "Entropy"   = $entropy
        }
    } catch {
        return [PSCustomObject]@{
            "File Path" = $Path
            "Entropy"   = "Error: $_"
        }
    }
}

Function Scan-Directory {
    param ($Dir)
    $results = @()
    $files = Get-ChildItem -Path $Dir -Recurse -Include *.exe, *.dll -File
    $total = $files.Count
    $i = 0

    foreach ($file in $files) {
        $i++
        Write-Progress -Activity "Scanning Files..." -Status "$($file.Name) ($i of $total)" -PercentComplete (($i / $total) * 100)
        $results += Scan-File $file.FullName
    }

    $results | Format-Table -AutoSize
}

# Main
if ($File) {
    Scan-File $File | Format-Table -AutoSize
} elseif ($Directory) {
    Scan-Directory $Directory
} else {
    Write-Host "❌ Please provide -File or -Directory parameter." -ForegroundColor Red
}
