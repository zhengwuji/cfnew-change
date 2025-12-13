# 自动Git推送脚本
# 自动添加、提交并强制推送到GitHub，无需询问

param(
    [string]$CommitMessage = ""
)

$ErrorActionPreference = "Continue"

# 切换到脚本所在目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

# 配置Git环境变量，确保不询问
$env:GIT_EDITOR = "true"
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_ASKPASS = "echo"

Write-Host "🔄 开始自动Git推送流程..." -ForegroundColor Cyan

# 配置Git（如果需要）
git config --local push.default simple 2>$null
git config --local core.autocrlf true 2>$null
git config --local push.defaultCurrent simple 2>$null

# 添加所有更改
Write-Host "📦 添加所有更改到暂存区..." -ForegroundColor Yellow
git add -A 2>&1 | Out-Null

# 检查是否有更改
$status = git status --porcelain
if ($status) {
    # 如果没有提供提交信息，使用时间戳
    if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $CommitMessage = "自动提交: $timestamp - 代码更新"
    }
    
    Write-Host "💾 提交更改: $CommitMessage" -ForegroundColor Yellow
    $commitResult = git commit -m $CommitMessage 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "🚀 强制推送到GitHub（自动允许，不询问）..." -ForegroundColor Yellow
        # 使用 --force 强制推送，所有提示都自动确认
        $pushResult = git push --force origin main 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ 成功！代码已推送到 https://github.com/zhengwuji/cfnew-change" -ForegroundColor Green
        } else {
            Write-Host "❌ 推送失败:" -ForegroundColor Red
            Write-Host $pushResult -ForegroundColor Red
        }
    } else {
        Write-Host "❌ 提交失败:" -ForegroundColor Red
        Write-Host $commitResult -ForegroundColor Red
    }
} else {
    Write-Host "ℹ️  没有检测到更改，跳过推送" -ForegroundColor Cyan
}

Write-Host "✨ 完成！" -ForegroundColor Green


