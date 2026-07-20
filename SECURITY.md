# Security and data-safety model

## Authority model

- 本机来源资料夹是唯一正式母资料。
- Google Drive 挂载目标是可复原的备份镜像。
- 本工具不会把云端端修改反向覆盖本机来源。

## Destructive-operation protection

- 不使用 Robocopy `/MIR` 或 `/PURGE`。
- 目标端额外项目先移入时间戳记 `99_recycle` 快照。
- MirrorSafe 执行前必须产生并核对 PlanId。
- 来源或目标内容改变后，旧计划自动失效。
- 影响项目数、比例或容量超过门槛时停止。
- 来源突然为空、路径不存在或来源与目标重叠时停止。
- 永久清理回收区必须另外输入 `PURGE RECYCLE`。

## Sensitive data

请勿提交以下个人资料：

- 实际使用中的 `Backup_Config.json`
- 私人本机绝对路径与 Google Drive 文件清单
- 执行日志、Manifest、Plan 与回收快照
- 公司、客户、学校或个人机密档案

储存库只保存公开程式、预设设定、安装封装与技术说明。

## Validation boundary

v4.0.0 已完成静态结构、JSON、禁止危险参数与安全政策检查。Windows PowerShell 5.1、GoogleDriveFS、Robocopy 与工作排程器仍须在实际 Windows 10／11 电脑完成首次实机验证。
