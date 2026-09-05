# google-drive-desktop-backup-manager

## 目標

提供 Windows 本機資料夾備份與安全鏡像管理器；本機來源是唯一母資料，Google Drive for desktop 是可回復備份目標。

## 專案結構

- `README.md`、`INSTALL.md`、`SECURITY.md`：使用、安裝與安全契約。
- `CHANGELOG.md`、`VERSION`：每次收工變更與正式版本。
- `releases/`：已發布安裝包、SHA-256 與說明。
- `handoff.md`：目前排程驗證與唯一續跑點。

## 共用規則

1. 開工只讀本檔、`handoff.md` 與 Git 狀態。
2. 保留既有修改；不提交 secret、credential、私人備份資料或未知檔案。
3. canonical 路徑使用專案相對路徑；實際來源與目標只在 runtime 解析。
4. Google Drive 目標禁止反向覆寫本機來源。
5. CopySafe 是預設；MirrorSafe 必須先預覽、核對 PlanId 並通過安全門檻。
6. 不直接使用 Robocopy `/MIR` 或 `/PURGE`；目標額外項目先進日期化 `99_recycle`。
7. 每次收工更新 `CHANGELOG.md` 與 `handoff.md`；GitHub delivery 前更新 README。
8. 備份執行、MirrorSafe、排程、安裝、purge、commit、push 與 release 須由工作單／ReadyGate 放行。
9. 外部知識庫一律 `ON_DEMAND_ONLY`，不屬於 initial／startup／shutdown。

## 整合

- GitHub：public `sink6985757-web/google-drive-desktop-backup-manager`
- Google Drive Desktop：備份目標層
- 外部知識庫：`ON_DEMAND_ONLY`

## Portable lifecycle 維護契約

- 專案：`sink6985757-web/google-drive-desktop-backup-manager`；default branch：`main`；Git root 必須是本 repository。
- 依 `.agents/project-lifecycle.json` 使用 manual checkpoint；authority pin 指向已回讀的治理來源。
- Startup 只讀文件與 Git，fetch 後同時確認 upstream／default branch；不得用工作 branch 已同步冒充 default branch 已包含成果。
- Shutdown 每次更新 CHANGELOG／handoff；README 隨人類安裝、使用或版本變化更新。
- 本次已確認工作單的授權沿用至其範圍完成；不得擴張到 tag／Release、權限、刪除或封存。
- 本輪不觸發備份／MirrorSafe、不安裝、不 purge 或修改排程。既有排程的 LastTaskResult=0 仍需在原裝置自然執行後回讀。來源是母資料，Drive 是目標；禁止直接 /MIR／/PURGE，额外項目先入 99_recycle。
