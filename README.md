# Google Drive Desktop Backup Manager

Windows 10／11 的本機資料夾備份與安全鏡像管理器，搭配 Google Drive for desktop 與 Windows 內建 Robocopy 使用。

目前版本：**v4.0.0 — MirrorSafe**

## 核心定位

- 本機來源資料夾是唯一正式母資料。
- Google Drive 掛載資料夾是可復原的雲端備份目標。
- 不把雲端端修改反向覆寫本機來源。
- 不使用 Robocopy `/MIR` 或 `/PURGE` 直接刪除目標內容。

## 两种模式

### CopySafe

默认且最保守的日常模式：

- 新增本机文件时，复制到 Google Drive 目标。
- 修改本机文件时，更新 Google Drive 目标。
- 本机删除、移动或改名时，目标旧位置暂时保留。

### MirrorSafe

用于整理目标端旧位置的安全镜像模式：

1. 扫描本机来源与 Google Drive 目标。
2. 产生差异预览与 PlanId。
3. 检查影响项目数、比例及容量安全门槛。
4. 重新扫描，确认资料没有变化。
5. 将目标端旧位置移入 `99_recycle`，不永久删除。
6. 复制新增与修改内容。
7. 再次比较来源与目标并产生验证记录。

## 默认安全门槛

- 单次最多影响 20 个项目。
- 单一来源最多影响 2%。
- 单次最多移入回收区 5 GB。
- 目标已有资料时，来源不可突然为空。
- 预览计划有效期为 24 小时。
- 自动 MirrorSafe 必须明确输入 `ENABLE AUTO MIRROR`。
- 永久清理回收区必须明确输入 `PURGE RECYCLE`。

回收位置：

```text
<BackupRoot>\99_recycle\GDDM_MirrorSafe\<timestamp>_<PlanId>
```

## 安装包

正式 ZIP 将发布在：

```text
releases/v4.0.0/GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.0.zip
```

SHA-256：

```text
c681430422703f43858596a718ea0d6aefd278c2c687f11e37ab40f22008688d
```

### 从 v3 升级

1. 确认 Google Drive 系统匣显示同步完成。
2. 解压缩 v4 安装包。
3. 执行 `Verify_Package.cmd`。
4. 执行 `Install.cmd`，不要执行 `Fresh_Install.cmd`。
5. 确认目前正式来源路径，例如 `D:\NOTEd`。
6. 升级后默认仍使用 CopySafe。
7. 第一次 MirrorSafe 先预览，再依 PlanId 手动执行。

完整说明见 [INSTALL.md](INSTALL.md)、[CHANGELOG.md](CHANGELOG.md) 与 [SECURITY.md](SECURITY.md)。

## 重要限制

- 这不是完全双向同步工具。
- Google Drive 的实际上载、移动、版本与同步状态仍由 Google Drive for desktop 负责。
- 不要让同一组资料夹同时由另一套镜像工具管理。
- 第一次正式 MirrorSafe 必须在实际 Windows 10／11 电脑验证来源路径、D 槽挂载、Robocopy 与 Google Drive 登录状态。
