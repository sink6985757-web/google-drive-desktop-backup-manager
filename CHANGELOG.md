# Changelog

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
