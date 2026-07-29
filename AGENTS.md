# google-drive-desktop-backup-manager

## 目標
提供 Windows 10／11 的本機資料夾備份與安全鏡像管理器，以本機來源作為唯一正式母資料，搭配 Google Drive for desktop 與 Robocopy 建立可復原且不直接永久刪除目標內容的備份流程。

## 路線圖
- [x] 建立保守的 CopySafe 日常備份模式。
- [x] 建立含預覽、PlanId、安全門檻與回收區的 MirrorSafe 模式。
- [x] 移除公開文件與安裝包中的裝置專屬路徑。
- [x] 發布並驗證 MirrorSafe Portable v4.0.2。
- [ ] 正常排程執行下一次自動 MirrorSafe 後，只讀確認 `LastTaskResult=0`。

## 專案結構
- `README.md`：使用模式、安裝、升級與 v4.0.2 入口。
- `INSTALL.md`：完整安裝與設定流程。
- `SECURITY.md`：資料權威、破壞性操作防護與驗證邊界。
- `CHANGELOG.md`：版本更動。
- `VERSION`：目前版本。
- `releases/v4.0.2/`：正式安裝 ZIP、SHA-256 與發布說明。
- `AGENTS.md`：穩定的治理規則與安全邊界。
- `handoff.md`：最近一次工作交接。

## 共用規則
1. 每個 Agent 開工先讀本檔與 `handoff.md`。
2. 保留既有修改；不提交 secret、credential 或未知檔案。
3. 所有 canonical 路徑使用專案相對路徑。
4. 本機來源資料夾是唯一正式母資料；Google Drive 掛載資料夾只作可復原備份目標，禁止反向覆寫來源。
5. CopySafe 是預設日常模式；MirrorSafe 必須先預覽、核對有效 PlanId，並通過項目數、比例、容量、來源非空與路徑不重疊等安全門檻。
6. 不得直接使用 Robocopy `/MIR` 或 `/PURGE`；目標端額外項目必須先移入日期化 `99_recycle`。
7. 自動 MirrorSafe 與永久清理回收區分別需要明確確認字串；未經工作單不得觸發備份、MirrorSafe、排程、安裝或 purge。
8. 實際來源、目標與安裝位置只在 runtime 從資料夾選擇器或本機設定解析，不寫入公開文件。
9. `Backup_Config.json`、日誌、Manifest、Plan、回收快照及私人路徑或檔名不得提交。
10. 開工只讀；收工才更新交接、GitHub 與 Obsidian。

## 整合
- GitHub：[sink6985757-web/google-drive-desktop-backup-manager](https://github.com/sink6985757-web/google-drive-desktop-backup-manager)（public）
- Obsidian：`google-drive-desktop-backup-manager/專案工作流程.md`
