param(
    [Parameter(Mandatory=$true)]
    [string]$FolderPath
)

if (-not (Test-Path $FolderPath)) {
    Write-Error "Folder '$FolderPath' does not exist!"
    exit 1
}

Write-Host ("{0,-40} {1,-50}" -f "DLL Name", "Developer")
Write-Host ("-" * 90)

Get-ChildItem -Path $FolderPath -Recurse -Filter "*.dll" | ForEach-Object {
    try {
        $versionInfo = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($_.FullName)
        $company = if ($versionInfo.CompanyName) { $versionInfo.CompanyName } else { "Unknown" }
        Write-Host ("{0,-40} {1,-50}" -f $_.Name, $company)
    }
    catch {
        Write-Host ("{0,-40} {1,-50}" -f $_.Name, "Error reading file")
    }
}
