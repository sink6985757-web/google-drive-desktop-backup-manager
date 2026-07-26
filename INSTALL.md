# 安裝與升級

## 下載正式安裝包

1. 開啟 [v4.0.2 GitHub Release](https://github.com/sink6985757-web/google-drive-desktop-backup-manager/releases/tag/v4.0.2)。
2. 下載 `GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip`。
3. 在下載資料夾執行：

```powershell
Get-FileHash .\GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip -Algorithm SHA256
```

4. 將結果與 [`releases/v4.0.2/SHA256SUMS.txt`](releases/v4.0.2/SHA256SUMS.txt) 比對。
5. 雜湊不符時停止，不要解壓縮或執行。

Repository 內的 [`releases/v4.0.2/`](releases/v4.0.2/) 保存相同 ZIP、SHA-256 與版本說明。v4.0.0 的 Base64 分段只保留作為歷史資料，不應用於新安裝。

## 全新安裝

1. 解壓縮 v4.0.2 ZIP。
2. 執行 `Verify_Package.cmd`。
3. 執行 `Fresh_Install.cmd`。
4. Google Drive for desktop 若尚未安裝，安裝器只會從 Google 官方網址下載並驗證數位簽章。
5. 在 Google 官方視窗完成登入。
6. 透過資料夾選擇器選擇本機來源與 Google Drive 目標；不要直接沿用別台電腦的固定路徑。
7. 第一次保留 CopySafe，先完成環境驗證與模擬。

`<SourceFolder>` 與 `<GoogleDriveFolder>` 是文件占位符。程式需要的 Windows 完整路徑會在目前裝置 runtime 取得，不寫入 repository。

## 從 v3、v4.0.0 或 v4.0.1 升級

1. 確認 Google Drive 系統匣顯示同步完成。
2. 解壓縮 v4.0.2 ZIP。
3. 執行 `Verify_Package.cmd`。
4. 執行 `Install.cmd`，不要執行 `Fresh_Install.cmd`。
5. 既有來源、目標、排程、日誌與狀態會保留；升級後預設仍為 CopySafe。
6. 在設定精靈確認目前裝置的真實來源與目標。
7. 第一次 MirrorSafe 必須先產生預覽，再依 PlanId 手動確認。

## 安裝後檢查

- 桌面可開啟「Google Drive Backup Manager」。
- 設定精靈中的來源與目標皆存在、可讀寫且互不重疊。
- CopySafe 模擬沒有錯誤。
- 正式備份後 Google Drive 系統匣顯示同步完成。
- 啟用 MirrorSafe 前已檢查 PlanId、影響項目、比例與容量。

## 不要上傳的本機檔案

- 實際使用中的 `Backup_Config.json`
- `logs/`
- `state/`
- `config_backups/`
- Manifest、Plan、回收快照與檔案清單

這些檔案可能含私人路徑、檔名或組織資料。
