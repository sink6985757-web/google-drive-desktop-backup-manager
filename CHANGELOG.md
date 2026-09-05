# Changelog

## [Unreleased] - 2026-09-05

- `WO-DRIVE-GITHUB-ALIGN-20260905-v2`：保留 MirrorSafe Portable v4.0.2、CopySafe 預設與單向備份契約；更新 manual checkpoint 與收工續跑點。
- 建立／對齊 portable manual manifest，區分工作 branch、GitHub default branch 與 Drive 同步。
- 驗證：Git root／remote identity、四檔與 manifest schema、相對連結及 diff whitespace 檢查；程式與 runtime 未變，不將歷史實機測試標為本輪重跑。
- 本輪為 source／文件 checkpoint；不新增 tag／Release。

## Unreleased — 2026-08-09

### Changed

- 對齊四檔生命週期、README delivery 規則與外部知識庫獨立邊界。

### Validation

- 本輪只更新治理文件；未執行備份、MirrorSafe、排程或安裝。

### Delivery

- GitHub：`VERIFIED`，治理 commit `a8ac6ffa49a697509c6c427ea20e3b49faa412d1` 已推送 `main` 並回讀一致。

## v4.0.2 — 2026-07-26

### Fixed

- 修正 `Invoke-Robocopy` 將 Robocopy 主控台輸出與 ExitCode 一起回傳，導致複製成功後仍可能誤報驗證失敗。
- CopySafe 與 MirrorSafe 的執行後驗證現在只比較數值 ExitCode。

### Validation

- Windows 11、GoogleDriveFS、Robocopy 實機 CopySafe 驗證通過。
- ValidateOnly、DryRun、正式複製、SHA-256 比對與工作排程器狀態檢查通過。
- 實際安裝由 v4.0.0 升級至 v4.0.2，既有來源、目標、模式及排程設定均保留。

## v4.0.1 — 2026-07-26

### Changed

- 新安裝改為直接下載並驗證 ZIP，不再要求重組 Base64 片段。
- 安裝精靈的來源預設改由目前使用者的文件資料夾動態解析。
- README、安裝說明與封裝文件全面改用占位符，不再出現個人磁碟路徑。
- 新增新使用者前置需求、安裝後檢查與不可上傳檔案清單。

### Fixed

- 以可直接驗證的完整 ZIP 取代 v4.0.0 的異常 Base64 分段。
- 避免 Windows PowerShell 5.1 解析無 BOM UTF-8 還原腳本時失敗。

## v4.0.0 — 2026-07-20

### Added

- MirrorSafe 安全镜像模式。
- 差异预览、PlanId 与计划有效期。
- 影响项目数、比例及回收容量安全门槛。
- 来源突然为空、路径不存在、来源与目标重叠时自动停止。
- 目标端旧位置移入时间戳记 `99_recycle` 快照，不永久删除。
- 执行后重新扫描及只读 Robocopy 验证。
- MirrorPreview 与需明确启用的 MirrorSafeAuto 排程模式。
- v3 至 v4 设定迁移。
- 安装包 Manifest、SHA-256 与静态验证报告。

### Safety

- 不使用 Robocopy `/MIR` 或 `/PURGE`。
- 来源或目标内容改变时，既有 PlanId 失效。
- 自动镜像与永久清理回收区均需额外明确确认。

## v3.0.0

- Google Drive for desktop 安装与检查。
- CopySafe 单向新增／更新备份。
- 来源、目标、排程、日志与解除安装管理。
