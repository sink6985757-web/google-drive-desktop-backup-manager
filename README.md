# Google Drive Desktop Backup Manager

Windows 10／11 的本機資料夾備份與安全鏡像管理器，搭配 Google Drive for desktop 與 Windows 內建 Robocopy 使用。

目前版本：**v4.0.2 — MirrorSafe Portable**

## 核心定位

- 本機來源資料夾是唯一正式母資料。
- Google Drive 掛載資料夾是可復原的雲端備份目標。
- 不把雲端端修改反向覆寫本機來源。
- 不使用 Robocopy `/MIR` 或 `/PURGE` 直接刪除目標內容。
- Repository、安裝包與文件不保存任何使用者名稱、私人磁碟路徑或 Google Drive 檔案清單。

## 路徑表示方式

文件中的 `<SourceFolder>`、`<GoogleDriveFolder>` 與 `<InstallFolder>` 都是占位符，不是要照字面建立的資料夾。

備份工具執行時必須取得 Windows 完整路徑，但新安裝會透過資料夾選擇器取得，不再預設任何人的磁碟機或家目錄。程式安裝位置預設從 `%LOCALAPPDATA%` 動態解析；不應把某台電腦的固定絕對路徑提交到 repository。

## 兩種模式

### CopySafe

預設且最保守的日常模式：

- 本機新增檔案時，複製到 Google Drive 目標。
- 本機修改檔案時，更新 Google Drive 目標。
- 本機刪除、移動或改名時，目標舊位置暫時保留。

### MirrorSafe

用於整理目標端舊位置的安全鏡像模式：

1. 掃描本機來源與 Google Drive 目標。
2. 產生差異預覽與 PlanId。
3. 檢查影響項目數、比例及容量安全門檻。
4. 執行前重新掃描，資料有變化時舊 PlanId 失效。
5. 將目標端舊位置移入 `99_recycle`，不永久刪除。
6. 複製新增與修改內容。
7. 再次比較來源與目標並產生驗證紀錄。

## 預設安全門檻

- 單次最多影響 20 個項目。
- 單一來源最多影響 2%。
- 單次最多移入回收區 5 GB。
- 目標已有資料時，來源不可突然為空。
- 預覽計畫有效期為 24 小時。
- 自動 MirrorSafe 必須明確輸入 `ENABLE AUTO MIRROR`。
- 永久清理回收區必須明確輸入 `PURGE RECYCLE`。

回收位置：

```text
<BackupRoot>\99_recycle\GDDM_MirrorSafe\<timestamp>_<PlanId>
```

## 新使用者安裝

### 需求

- Windows 10 或 11。
- Windows PowerShell 5.1 以上。
- Google 帳號；登入由 Google Drive 官方視窗處理。
- 一個本機來源資料夾，以及 Google Drive for desktop 中不同且不重疊的目標資料夾。

### 下載與驗證 v4.0.2

從 [GitHub Releases](https://github.com/sink6985757-web/google-drive-desktop-backup-manager/releases/tag/v4.0.2) 下載：

```text
GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip
```

也可以從 repository 的 [`releases/v4.0.2/`](releases/v4.0.2/) 取得相同檔案與 SHA-256 清單。

在下載資料夾執行：

```powershell
Get-FileHash .\GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.2.zip -Algorithm SHA256
```

將結果與 [`releases/v4.0.2/SHA256SUMS.txt`](releases/v4.0.2/SHA256SUMS.txt) 比對；不一致時不要解壓縮或執行。

### 全新安裝

1. 解壓縮 ZIP。
2. 執行 `Verify_Package.cmd`。
3. 執行 `Fresh_Install.cmd`。
4. 在 Google 官方視窗完成登入。
5. 用資料夾選擇器選擇 `<SourceFolder>` 與 `<GoogleDriveFolder>`。
6. 第一次先保留 CopySafe，完成模擬後再決定是否執行正式備份。
7. 確認 Google Drive 系統匣顯示同步完成。

只有沒有既有設定，或確定要完整重設時，才執行 `Fresh_Install.cmd`。

### 從 v3、v4.0.0 或 v4.0.1 升級

1. 確認 Google Drive 系統匣顯示同步完成。
2. 解壓縮 v4.0.2 ZIP。
3. 執行 `Verify_Package.cmd`。
4. 執行 `Install.cmd`，不要執行 `Fresh_Install.cmd`。
5. 安裝器會保留既有來源、目標、排程、日誌與狀態。
6. 設定精靈中確認目前真正的來源與 Google Drive 目標。
7. 升級後預設仍使用 CopySafe；第一次 MirrorSafe 先預覽，再依 PlanId 手動執行。

## v4.0.2 修正

- 修正 CopySafe／MirrorSafe 執行後驗證的 Robocopy 回傳值處理。
- 避免檔案已成功複製且一致時，因 Robocopy 主控台輸出混入回傳值而誤報失敗。
- 已在 Windows 11、已登入的 Google Drive for desktop、Robocopy 與既有工作排程器環境完成實機 CopySafe 驗證。

## v4.0.1 修正

- 移除安裝精靈與說明中的個人磁碟路徑預設，改由使用者選擇資料夾。
- 改用可直接下載與驗證的 ZIP，不再要求新使用者重組 Base64 片段。
- 修正 v4.0.0 歷史 Base64 分段的完整性問題與 Windows PowerShell 編碼風險。
- 保留 v4.0.0 的 CopySafe／MirrorSafe 行為與安全門檻，不改變設定 Schema。

## 重要限制

- 這不是完全雙向同步工具。
- Google Drive 的實際上傳、移動、版本與同步狀態仍由 Google Drive for desktop 負責。
- 不要讓同一組資料夾同時由另一套鏡像工具管理。
- 第一次正式 MirrorSafe 必須在實際 Windows 10／11 電腦驗證來源、目標、Robocopy 與 Google Drive 登入狀態。
- `Backup_Config.json`、執行日誌、Manifest、Plan 與回收快照可能含私人路徑或檔名，不要提交到 GitHub。

完整說明見 [INSTALL.md](INSTALL.md)、[CHANGELOG.md](CHANGELOG.md)、[SECURITY.md](SECURITY.md) 與 [v4.0.2 發布說明](releases/v4.0.2/README.md)。
