# PowerShell自动推送脚本
# PowerShell自动推送脚本
# 使用方法: .\auto-push.ps1

# 自动推送脚本
Write-Host "开始执行 Git 操作..." -ForegroundColor Green

# 添加所有更改
git add .

# 获取当前时间作为提交信息
$commitMessage = "Auto update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git commit -m $commitMessage

# 强制推送到远程仓库
git push -f origin main

Write-Host "强制推送完成！" -ForegroundColor Green
Write-Host "提交信息: $commitMessage" -ForegroundColor Cyan
