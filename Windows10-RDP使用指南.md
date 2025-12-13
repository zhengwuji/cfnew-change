# Windows 10 使用RDP加速 - 完整指南

## 📋 准备工作

### 1. 安装Node.js

**下载地址:** https://nodejs.org/

- 下载Windows安装包（推荐LTS版本）
- 双击安装，一路"下一步"即可
- 安装完成后，重启电脑

**验证安装:**
```powershell
node --version
npm --version
```

如果显示版本号，说明安装成功。

---

## 🚀 快速开始

### 步骤1：下载桥接脚本

已为你准备好了 `rdp-bridge.js` 文件

### 步骤2：安装依赖

打开PowerShell（或CMD），进入脚本所在目录：

```powershell
cd C:\Users\Administrator\Desktop\4
npm install ws
```

### 步骤3：配置WebSocket地址

编辑 `rdp-bridge.js` 文件，找到第10行：

```javascript
const WS_URL = 'wss://ccrough-block-ebe1cc.852446634.workers.dev/rdp/{服务器ID}';
```

**⚠️ 重要：** 将 `{服务器ID}` 替换为实际的服务器ID

例如：
```javascript
const WS_URL = 'wss://ccrough-block-ebe1cc.852446634.workers.dev/rdp/abc123xyz';
```

### 步骤4：运行桥接服务

在PowerShell中运行：

```powershell
node rdp-bridge.js
```

**成功运行会显示:**
```
╔════════════════════════════════════════════════════════════╗
║         🎯 RDP WebSocket桥接服务已启动                     ║
╚════════════════════════════════════════════════════════════╝

📡 本地监听地址:  127.0.0.1:13389
🌐 WebSocket URL: wss://...

🖥️  使用方法:
   1. 打开"远程桌面连接" (mstsc.exe)
   2. 输入: localhost:13389
   3. 点击"连接"并输入远程服务器的用户名和密码

⏳ 等待RDP客户端连接...
```

### 步骤5：连接远程桌面

1. **打开远程桌面连接**
   - 按 `Win + R`
   - 输入 `mstsc`
   - 按回车

2. **输入地址**
   ```
   localhost:13389
   ```

3. **点击"连接"**

4. **输入远程服务器的用户名和密码**

5. **成功连接！** 🎉

---

## 📊 运行日志说明

运行时你会看到这些日志信息：

```
✅ 新的RDP客户端连接          # RDP客户端已连接
🔄 正在连接到WebSocket服务器...  # 开始连接Workers
✅ WebSocket连接已建立         # 连接成功
🚀 RDP流量转发已开始...       # 开始转发数据

⬆️  TCP->WS: 1024 字节        # 发送数据到服务器
⬇️  WS->TCP: 2048 字节        # 从服务器接收数据

💓 发送心跳包                  # 保持连接活跃
💚 收到心跳响应                # 连接正常

❌ RDP客户端断开连接          # 会话结束
```

---

## ⚙️ 高级配置

### 修改本地端口

如果端口13389被占用，可以修改为其他端口：

编辑 `rdp-bridge.js` 第13行：
```javascript
const LOCAL_PORT = 13389;  // 改为其他端口，如 33389
```

然后连接时使用新端口：
```
localhost:33389
```

### 修改心跳间隔

编辑第16行：
```javascript
const HEARTBEAT_INTERVAL = 30000;  // 30秒，可改为60000（1分钟）
```

---

## 🛠️ 故障排除

### 问题1：端口被占用

**错误信息:**
```
❌ 端口 13389 已被占用
```

**解决方法:**
- 修改脚本中的 `LOCAL_PORT` 为其他端口
- 或者关闭占用该端口的程序

**查看端口占用:**
```powershell
netstat -ano | findstr :13389
```

### 问题2：WebSocket连接失败

**可能原因:**
1. WebSocket URL不正确（服务器ID错误）
2. 网络防火墙阻止
3. Workers服务异常

**解决方法:**
- 检查URL是否正确
- 在RDP管理页面确认服务器ID
- 测试网络连接

### 问题3：连接后立即断开

**可能原因:**
- 目标RDP服务器不可达
- 目标服务器防火墙阻止
- Workers无法连接到目标服务器

**解决方法:**
- 确认目标RDP服务器正在运行
- 检查目标服务器防火墙设置
- 查看桥接脚本的错误日志

### 问题4：npm install失败

**解决方法1 - 使用国内镜像:**
```powershell
npm config set registry https://registry.npmmirror.com
npm install ws
```

**解决方法2 - 使用cnpm:**
```powershell
npm install -g cnpm --registry=https://registry.npmmirror.com
cnpm install ws
```

---

## 💡 使用技巧

### 1. 后台运行

使用 `pm2` 让脚本在后台运行：

```powershell
# 安装pm2
npm install -g pm2

# 启动服务
pm2 start rdp-bridge.js --name rdp-bridge

# 查看状态
pm2 status

# 查看日志
pm2 logs rdp-bridge

# 停止服务
pm2 stop rdp-bridge

# 开机自启
pm2 startup
pm2 save
```

### 2. 创建快捷方式

创建一个 `.bat` 文件，双击即可启动：

**start-rdp-bridge.bat:**
```batch
@echo off
cd C:\Users\Administrator\Desktop\4
node rdp-bridge.js
pause
```

### 3. Windows任务计划程序

设置开机自动启动：

1. 打开"任务计划程序"
2. 创建基本任务
3. 触发器："计算机启动时"
4. 操作："启动程序"
   - 程序：`node`
   - 参数：`C:\Users\Administrator\Desktop\4\rdp-bridge.js`
5. 完成

---

## 📞 获取服务器ID

### 方法1：通过RDP管理界面

1. 访问：`https://你的域名/{UUID}/rdp-admin`
2. 添加RDP服务器
3. 在服务器列表中查看WebSocket URL
4. 复制URL中的服务器ID部分

### 方法2：通过API

```powershell
# 获取服务器列表
curl https://你的域名/{UUID}/api/rdp-servers
```

返回示例：
```json
{
    "success": true,
    "servers": [
        {
            "id": "abc123xyz",
            "name": "办公服务器",
            "host": "192.168.1.100",
            "port": 3389
        }
    ]
}
```

---

## 🔒 安全建议

1. **不要在公共网络上运行**
   - 仅在受信任的网络环境中使用

2. **使用强密码**
   - 目标RDP服务器应设置强密码

3. **限制访问**
   - 配置目标服务器的防火墙规则

4. **定期更新**
   - 保持Node.js和依赖包最新

---

## 📝 完整操作流程示例

```powershell
# 1. 安装依赖（首次运行）
cd C:\Users\Administrator\Desktop\4
npm install ws

# 2. 编辑配置
notepad rdp-bridge.js
# 修改 WS_URL 中的服务器ID

# 3. 启动桥接服务
node rdp-bridge.js

# 4. 新开一个PowerShell窗口（让桥接服务保持运行）
# 5. 打开远程桌面
mstsc

# 6. 连接到 localhost:13389
# 7. 输入目标服务器的用户名和密码
# 8. 成功连接！
```

---

## ❓ 常见问题

**Q: 需要一直保持PowerShell窗口打开吗？**  
A: 是的，关闭窗口会停止桥接服务。可以使用pm2在后台运行。

**Q: 可以同时连接多个RDP服务器吗？**  
A: 可以！每个服务器启动一个桥接脚本实例，使用不同的本地端口。

**Q: 延迟高怎么办？**  
A: 这取决于网络质量和Cloudflare节点位置。可以尝试更换Workers部署区域。

**Q: 支持多显示器吗？**  
A: 支持！RDP协议的所有功能都支持，包括多显示器、音频转发等。

**Q: 连接会自动断开吗？**  
A: 脚本内置了心跳机制（每30秒），正常情况下不会断开。

---

## 🎉 完成

现在你已经可以通过WebSocket加速访问远程桌面了！

如果遇到问题，请查看：
- 桥接脚本的控制台输出
- Windows事件查看器
- 目标服务器的RDP日志

祝使用愉快！ 🚀
