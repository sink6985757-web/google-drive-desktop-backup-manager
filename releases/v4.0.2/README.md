# Google Drive Desktop Backup Manager v4.0.2

## 下載

正式安裝包：

[`GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip`](GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip)

SHA-256：

```text
bce7fcb0ef027c1a854fd8d5c26513fedbbd1281188bcb2f6b9d865b4ea14474
```

Windows PowerShell 驗證：

```powershell
Get-FileHash .\GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip -Algorithm SHA256
```

雜湊不一致時不要解壓縮或執行。

## 修正

- 修正 CopySafe／MirrorSafe 執行後驗證的 Robocopy 回傳值處理。
- v4.0.1 可能在檔案已成功複製且一致時，仍把 Robocopy 主控台輸出混入 ExitCode 並誤報失敗。
- 設定 Schema、CopySafe／MirrorSafe 行為與安全門檻不變。

## 安裝與升級

1. 解壓縮 ZIP。
2. 執行 `Verify_Package.cmd`。
3. 全新安裝執行 `Fresh_Install.cmd`；既有 v3／v4 使用者執行 `Install.cmd`。
4. 確認目前裝置的來源與 Google Drive 目標。
5. 第一次 MirrorSafe 仍先預覽，再依 PlanId 手動執行。

## 驗證

- 安裝包 23 個檔案的 SHA-256 全數通過。
- JSON 與 PowerShell 語法通過。
- 未使用 Robocopy `/MIR` 或 `/PURGE`。
- 未命中私鑰、token、credential 欄位、個人家目錄或裝置專屬路徑。
- Windows 11 上的 GoogleDriveFS、Robocopy、CopySafe ValidateOnly、DryRun、正式複製與執行後雜湊比對通過。
- 既有工作排程器項目、動作路徑與安裝目錄回讀通過；因現有排程為自動 MirrorSafe，本次未擅自手動觸發。
