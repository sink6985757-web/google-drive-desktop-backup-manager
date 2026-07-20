# 安装与升级

## 还原正式安装包

1. 下载 `releases/v4.0.0/base64/` 内的全部 16 个 `installer.b64.*.txt` 与 `Restore_Installer.ps1`。
2. 在 Windows PowerShell 中进入该资料夹。
3. 执行：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\Restore_Installer.ps1
```

4. 脚本会在上一层产生 `GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.0.zip`，并核对 SHA-256：

```text
c681430422703f43858596a718ea0d6aefd278c2c687f11e37ab40f22008688d
```

## 从 v3 升级

1. 确认 Google Drive 系统匣显示同步完成。
2. 解压缩 v4 ZIP。
3. 执行 `Verify_Package.cmd`。
4. 执行 `Install.cmd`，不要执行 `Fresh_Install.cmd`。
5. 确认目前正式来源路径，例如 `D:\NOTEd`。
6. v3 的来源、目标、排程、日志与状态会保留；升级后默认仍为 CopySafe。
7. 第一次 MirrorSafe 必须先产生预览，再依 PlanId 手动确认。

## 全新安装

只有没有既有设定，或确定要完整重设时，才执行 `Fresh_Install.cmd`。
