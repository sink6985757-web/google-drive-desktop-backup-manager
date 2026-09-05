# Handoff

## 目前狀態

- 更新：2026-09-05，Codex；工作單 `WO-DRIVE-GITHUB-ALIGN-20260905-v2` 已確認。
- 保留 MirrorSafe Portable v4.0.2、CopySafe 預設與單向備份契約；更新 manual checkpoint 與收工續跑點。
- 驗證：Git root／remote identity、四檔與 manifest schema、相對連結及 diff whitespace 檢查；程式與 runtime 未變，不將歷史實機測試標為本輪重跑。
- GitHub：`sink6985757-web/google-drive-desktop-backup-manager`，default branch `main`。本輪成果以本文件所在 commit 識別；完成非 force push 後，以 `git ls-remote origin refs/heads/main` 與 GitHub API 回讀核對。
- Checkpoint：`manual`；三個 authority immutable SHA 已寫入 `.agents/project-lifecycle.json`，不啟用 standing_scoped。

## 風險與保留

本輪不觸發備份／MirrorSafe、不安裝、不 purge 或修改排程。既有排程的 LastTaskResult=0 仍需在原裝置自然執行後回讀。來源是母資料，Drive 是目標；禁止直接 /MIR／/PURGE，额外項目先入 99_recycle。

既有測試與版本歷史查閱 CHANGELOG／Git；沒有本輪執行的裝置、安裝、部署或帳號驗證不得視為重新通過。

## 唯一續跑點

在既有排程下一次自然執行後唯讀確認結果；新裝置第一次 MirrorSafe 仍先預覽、核對 PlanId 與明確批准。

跨裝置接續先讀 manifest、AGENTS、本檔與 Git 狀態，fetch 並比較 default branch。GitHub SHA 回讀與 Drive 雲端回讀分別記錄；若任一未完成，保留該項 PARTIAL，不推論整體已同步。
