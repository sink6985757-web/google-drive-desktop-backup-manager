# Google Drive Desktop Backup Manager

Windows 10／11 的本機資料夾備份與安全鏡像管理器，搭配 Google Drive for desktop 與 Windows 內建 Robocopy 使用。

目前版本：**v4.0.0 — MirrorSafe**

## 核心定位

- 本機來源資料夾是唯一正式母資料。
- Google Drive 掛載資料夾是可復原的雲端備份目標。
- 不把雲端端修改反向覆寫本機來源。
- 不使用 Robocopy `/MIR` 或 `/PURGE` 直接刪除目標內容。

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

## 下載 v4.0.0

正式安裝包的完整內容保存在：

[`releases/v4.0.0/base64/`](releases/v4.0.0/base64/)

目前 GitHub 連接器無法直接寫入二進位 ZIP，因此原始安裝包拆成 16 個 Base64 片段；片段來自本次實際產生的 ZIP，並附一鍵還原與強制 SHA-256 驗證。

1. 下載完整的 `base64` 資料夾。
2. 在 Windows PowerShell 進入該資料夾。
3. 執行：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\Restore_Installer.ps1
```

成功後會產生：

```text
GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.0.zip
```

SHA-256 必須為：

```text
c681430422703f43858596a718ea0d6aefd278c2c687f11e37ab40f22008688d
```

片段缺漏、內容錯誤或雜湊不符時，還原腳本會刪除錯誤 ZIP 並停止。

## 從 v3 升級

1. 確認 Google Drive 系統匣顯示同步完成。
2. 還原並解壓縮 v4 安裝包。
3. 執行 `Verify_Package.cmd`。
4. 執行 `Install.cmd`，不要執行 `Fresh_Install.cmd`。
5. 確認正式來源路徑，例如 `D:\NOTEd`。
6. 升級後預設仍使用 CopySafe。
7. 第一次 MirrorSafe 先預覽，再依 PlanId 手動執行。

安裝包內含完整 PowerShell 原始碼、安裝與升級程序、CopySafe／MirrorSafe 引擎、排程管理、回收區管理、解除安裝、繁體中文說明、Manifest、SHA-256 清單與靜態驗證報告。

完整說明見 [INSTALL.md](INSTALL.md)、[CHANGELOG.md](CHANGELOG.md)、[SECURITY.md](SECURITY.md) 與 [v4.0.0 發布頁](releases/v4.0.0/README.md)。

## 重要限制

- 這不是完全雙向同步工具。
- Google Drive 的實際上傳、移動、版本與同步狀態仍由 Google Drive for desktop 負責。
- 不要讓同一組資料夾同時由另一套鏡像工具管理。
- 第一次正式 MirrorSafe 必須在實際 Windows 10／11 電腦驗證來源路徑、D 槽掛載、Robocopy 與 Google Drive 登入狀態。
