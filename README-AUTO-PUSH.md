# 自动Git推送配置说明

## 🚀 自动推送已配置完成

### GitHub仓库地址
- **仓库**: https://github.com/zhengwuji/cfnew-change
- **分支**: main
- **推送方式**: 强制推送 (--force)

### 📋 自动化功能

1. **Git Hook自动推送**
   - 每次执行 `git commit` 后，会自动执行 `git push --force origin main`
   - Hook位置: `.git/hooks/post-commit`

2. **PowerShell自动推送脚本**
   - 脚本文件: `auto-git-push.ps1`
   - 使用方法: `.\auto-git-push.ps1` 或 `.\auto-git-push.ps1 -CommitMessage "你的提交信息"`

### ⚙️ 当前Git配置

- **远程仓库**: origin → https://github.com/zhengwuji/cfnew-change.git
- **默认分支**: main
- **推送方式**: 强制推送（无需询问，自动允许）

### 📝 使用说明

#### 方式1: 使用Git命令（推荐）
```bash
git add -A
git commit -m "你的提交信息"
# 提交后会自动推送（通过post-commit hook）
```

#### 方式2: 使用PowerShell脚本
```powershell
# 自动生成提交信息
.\auto-git-push.ps1

# 使用自定义提交信息
.\auto-git-push.ps1 -CommitMessage "修复了某个bug"
```

### ⚠️ 注意事项

1. **强制推送**: 使用了 `--force` 参数，会覆盖远程分支历史
2. **自动执行**: 代码修改后会自动推送，无需手动确认
3. **无需询问**: 所有操作都是自动执行的

### 🔧 维护说明

如果需要修改Git配置或推送设置，可以编辑以下文件：
- Git Hook: `.git/hooks/post-commit`
- PowerShell脚本: `auto-git-push.ps1`

---

**最后更新**: 2024年（自动配置完成）

