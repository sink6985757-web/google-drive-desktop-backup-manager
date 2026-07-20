# Google Drive Desktop Backup Manager v4.0.0

## 下载与还原

目前 GitHub 连接器无法直接上传二进制 ZIP，因此正式安装包以可验证的 Base64 分段保存于 [`base64/`](./base64/)；分段合并后与原始安装包位元一致。

1. 下载完整的 `base64` 资料夹。
2. 在 Windows PowerShell 中进入该资料夹。
3. 执行：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\Restore_Installer.ps1
```

4. 成功后会在上一层产生：

```text
GoogleDrive_Desktop_Backup_Manager_Total_Installer_v4.0.0.zip
```

5. 脚本会强制验证 SHA-256：

```text
c681430422703f43858596a718ea0d6aefd278c2c687f11e37ab40f22008688d
```

若片段缺漏、Base64 内容错误或 SHA-256 不符，脚本会删除错误 ZIP 并停止。

## 安装

### 从 v3 升级

1. 确认 Google Drive 系统匣显示同步完成。
2. 解压缩还原后的 ZIP。
3. 执行 `Verify_Package.cmd`。
4. 执行 `Install.cmd`。
5. 确认正式本机来源路径，例如 `D:\NOTEd`。
6. 升级后默认仍使用 CopySafe；第一次 MirrorSafe 请先产生预览计划。

### 全新安装

只有没有既有设置，或确定要完整重设时，才执行 `Fresh_Install.cmd`。

## 包含内容

安装包内含完整 PowerShell 原始码、安装与升级程序、CopySafe／MirrorSafe 引擎、排程管理、回收区管理、解除安装、繁体中文说明、Manifest、SHA-256 清单与静态验证报告。
