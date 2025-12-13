# 自动强制推送脚本 - 立即推送，不询问
# 使用方式：.\auto-push-force.ps1
# 或者：.\auto-push-force.ps1 -Message "自定义提交信息"

param(
    [string]$Message = ""
)

$ErrorActionPreference = "SilentlyContinue"

# 配置Git环境变量，确保不询问任何内容
$env:GIT_EDITOR = "true"
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_ASKPASS = "echo"

# 切换到脚本所在目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "🔄 自动强制推送流程开始..." -ForegroundColor Cyan

# 配置Git
git config --local push.default simple 2>$null
git config --local core.autocrlf true 2>$null

# 添加所有更改
git add -A 2>&1 | Out-Null

# 检查是否有更改
$status = git status --porcelain
if ($status) {
    # 生成提交信息
    if ([string]::IsNullOrWhiteSpace($Message)) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $Message = "自动提交: $timestamp"
    }
    
    # 提交更改（不询问）
    Write-Host "💾 提交更改: $Message" -ForegroundColor Yellow
    git commit -m $Message 2>&1 | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        # 强制推送（不询问，自动允许）
        Write-Host "🚀 强制推送到 GitHub (自动允许)..." -ForegroundColor Yellow
        git push --force origin main 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ 成功！已推送到 https://github.com/zhengwuji/cfnew-change" -ForegroundColor Green
        } else {
            Write-Host "❌ 推送失败，请检查网络或GitHub权限" -ForegroundColor Red
        }
    } else {
        Write-Host "❌ 提交失败" -ForegroundColor Red
    }
} else {
    Write-Host "ℹ️  没有检测到更改，跳过推送" -ForegroundColor Cyan
}

