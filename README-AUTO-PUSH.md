# 自动Git推送配置说明

## 🚀 自动推送已配置完成

### GitHub仓库地址
- **仓库**: https://github.com/zhengwuji/cfnew-change
- **分支**: main
- **推送方式**: 强制推送 (--force)
- **自动化**: 无需询问，自动允许所有操作

### 📋 自动化功能

1. **Git Hook自动推送（推荐）**
   - 每次执行 `git commit` 后，会自动执行 `git push --force origin main`
   - Hook位置: `.git/hooks/post-commit`
   - 完全自动化，无需任何手动操作

2. **PowerShell自动推送脚本**
   - **主脚本**: `auto-git-push.ps1` - 完整流程（添加、提交、推送）
   - **快速脚本**: `auto-push-force.ps1` - 快速强制推送
   - **简单脚本**: `auto-push.ps1` - 基础推送脚本

### ⚙️ 当前Git配置

- **远程仓库**: origin → https://github.com/zhengwuji/cfnew-change.git
- **默认分支**: main
- **推送方式**: 强制推送（`--force`）
- **自动执行**: 所有操作自动完成，无需询问

### 📝 使用说明

#### 方式1: 使用Git命令（最推荐 - 完全自动）
```powershell
# 只需要提交，推送会自动执行
git add -A
git commit -m "你的提交信息"
# 提交后会自动强制推送到GitHub（通过post-commit hook）
```

#### 方式2: 使用PowerShell脚本（一键推送）
```powershell
# 自动添加、提交、推送（使用默认提交信息）
.\auto-git-push.ps1

# 使用自定义提交信息
.\auto-git-push.ps1 -CommitMessage "修复了某个bug"

# 或使用快速脚本
.\auto-push-force.ps1
.\auto-push-force.ps1 -Message "自定义提交信息"
```

### 🔥 重要特性

1. **强制推送**: 使用 `--force` 参数，会覆盖远程分支历史
2. **自动执行**: 代码修改后自动推送，无需手动确认
3. **无需询问**: 所有操作都是自动执行的，包括：
   - 自动添加所有更改
   - 自动生成提交信息（如果未指定）
   - 自动强制推送，无需确认
4. **环境变量**: 已配置 `GIT_TERMINAL_PROMPT=0` 和 `GIT_EDITOR=true` 确保不询问

### ⚠️ 注意事项

1. **强制推送风险**: 使用 `--force` 会覆盖远程分支历史，请谨慎使用
2. **自动提交**: 如果没有提供提交信息，会自动使用时间戳生成
3. **网络要求**: 需要能够访问 GitHub，确保网络连接正常
4. **权限要求**: 需要确保有推送到该仓库的权限

### 🔧 维护说明

如果需要修改Git配置或推送设置，可以编辑以下文件：
- Git Hook: `.git/hooks/post-commit`
- PowerShell脚本: `auto-git-push.ps1` 或 `auto-push-force.ps1`
- Git配置: `.git/config`

### 📌 工作原理

1. **Git Hook方式**:
   - 当你执行 `git commit` 时
   - Git会自动触发 `.git/hooks/post-commit` 脚本
   - 脚本自动执行 `git push --force origin main`
   - 无需任何手动操作

2. **脚本方式**:
   - 运行 PowerShell 脚本
   - 脚本自动执行：`git add -A` → `git commit` → `git push --force`
   - 全程自动化，无需确认

---

**最后更新**: 2025-12-13（已配置强制推送，自动执行）


