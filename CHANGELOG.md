# Changelog

## v4.0.1 — 2026-07-26

### Changed

- 新安裝改為直接下載並驗證 ZIP，不再要求重組 Base64 片段。
- 安裝精靈的來源預設改由目前使用者的文件資料夾動態解析。
- README、安裝說明與封裝文件全面改用占位符，不再出現個人磁碟路徑。
- 新增新使用者前置需求、安裝後檢查與不可上傳檔案清單。

### Fixed

- 修正 v4.0.0 Base64 分段多出字元，導致還原檔案與公告 SHA-256 不一致的問題。
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
