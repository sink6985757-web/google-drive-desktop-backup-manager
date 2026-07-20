#requires -version 5.1
[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.0.zip')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedSha256 = 'c681430422703f43858596a718ea0d6aefd278c2c687f11e37ab40f22008688d'
$ExpectedPartCount = 16
$Parts = @(Get-ChildItem -LiteralPath $PSScriptRoot -Filter 'installer.b64.*.txt' -File | Sort-Object Name)

if ($Parts.Count -ne $ExpectedPartCount) {
    throw "安装包分段数量错误：预期 $ExpectedPartCount，实际 $($Parts.Count)。"
}

$Base64 = ($Parts | ForEach-Object {
    (Get-Content -LiteralPath $_.FullName -Raw -Encoding ASCII) -replace '\s', ''
}) -join ''

try {
    $Bytes = [Convert]::FromBase64String($Base64)
    $Parent = Split-Path -Parent $OutputPath
    if ($Parent) { New-Item -ItemType Directory -Path $Parent -Force | Out-Null }
    [IO.File]::WriteAllBytes($OutputPath, $Bytes)
}
catch {
    Remove-Item -LiteralPath $OutputPath -Force -ErrorAction SilentlyContinue
    throw "Base64 还原失败：$($_.Exception.Message)"
}

$ActualSha256 = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($ActualSha256 -ne $ExpectedSha256) {
    Remove-Item -LiteralPath $OutputPath -Force -ErrorAction SilentlyContinue
    throw "SHA-256 不符。实际：$ActualSha256；预期：$ExpectedSha256。错误 ZIP 已删除。"
}

Write-Host "[PASS] 安装包还原完成：$OutputPath" -ForegroundColor Green
Write-Host "SHA-256：$ActualSha256"
