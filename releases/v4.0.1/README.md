# Google Drive Desktop Backup Manager v4.0.1

## 下載

正式安裝包：

[`GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.1.zip`](GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.1.zip)

SHA-256：

```text
294c1bae93f4f7cb4397c8fa8b857f318810bc28936a6c59e5eb5a4f59ef6917
```

Windows PowerShell 驗證：

```powershell
Get-FileHash .\GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.1.zip -Algorithm SHA256
```

雜湊不一致時不要解壓縮或執行。

## 安裝

### 全新安裝

1. 解壓縮 ZIP。
2. 執行 `Verify_Package.cmd`。
3. 執行 `Fresh_Install.cmd`。
4. 在 Google 官方視窗完成登入。
5. 用資料夾選擇器選擇目前裝置的本機來源與 Google Drive 目標。
6. 第一次保留 CopySafe，完成模擬與環境驗證後再執行正式備份。

### 從 v3 或 v4.0.0 升級

1. 確認 Google Drive 系統匣顯示同步完成。
2. 解壓縮 ZIP 並執行 `Verify_Package.cmd`。
3. 執行 `Install.cmd`，不要執行 `Fresh_Install.cmd`。
4. 保留既有設定，並確認目前裝置的來源與目標路徑。
5. 第一次 MirrorSafe 先預覽，再依 PlanId 手動執行。

## v4.0.1 變更

- 移除個人磁碟路徑與裝置專屬來源預設。
- 首次設定改從目前使用者的文件資料夾開啟資料夾選擇器。
- 改用可直接下載與驗證的完整 ZIP。
- 修正 v4.0.0 Base64 分段完整性與 Windows PowerShell 5.1 編碼相容問題。
- CopySafe／MirrorSafe 行為、安全門檻與設定 Schema 維持不變。

## 驗證邊界

此封裝已通過檔案清單、SHA-256、JSON、PowerShell 語法、路徑遮蔽與安全政策靜態檢查。GoogleDriveFS、Robocopy、Google Drive 登入與 Windows 工作排程器仍需在安裝電腦完成首次實機驗證。
