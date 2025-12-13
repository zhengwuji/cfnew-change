# PowerShell脚本 - 自动添加、提交并强制推送到GitHub
# 每次修改代码后运行此脚本

$ErrorActionPreference = "Continue"

Write-Host "开始自动推送流程..." -ForegroundColor Green

# 切换到项目目录
Set-Location $PSScriptRoot

# 添加所有更改
Write-Host "添加所有更改到暂存区..." -ForegroundColor Yellow
git add -A

# 检查是否有更改
$status = git status --porcelain
if ($status) {
    # 获取当前时间作为提交信息
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $commitMessage = "自动提交: $timestamp - 代码更新"
    
    Write-Host "提交更改..." -ForegroundColor Yellow
    git commit -m $commitMessage
    
    Write-Host "强制推送到GitHub..." -ForegroundColor Yellow
    git push --force origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ 代码已成功推送到GitHub!" -ForegroundColor Green
    } else {
        Write-Host "❌ 推送失败，请检查网络连接或GitHub权限" -ForegroundColor Red
    }
} else {
    Write-Host "没有检测到更改，跳过推送" -ForegroundColor Cyan
}

