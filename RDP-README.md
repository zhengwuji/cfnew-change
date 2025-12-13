# RDP加速功能使用指南

## 📋 功能简介

RDP加速功能允许你通过Cloudflare Workers加速访问远程桌面服务器，使用WebSocket隧道技术实现高效的RDP协议代理。

## 🚀 快速开始

### 1. 访问管理界面

访问URL：`https://你的域名/{UUID}/rdp-admin`

例如：`https://your-worker.workers.dev/9ac70987-feda-4925-83a2-9f3328c28f4a/rdp-admin`

> 💡 **提示**：将 `{UUID}` 替换为你设置的环境变量 `u` 的值

### 2. 添加RDP服务器

在管理界面中填写：
- **服务器名称**：例如"办公服务器"
- **服务器地址**：RDP服务器的IP或域名（例如：192.168.1.100）
- **RDP端口**：默认3389

点击"添加服务器"按钮保存配置。

### 3. 获取WebSocket连接地址

添加服务器后，在服务器列表中会显示WebSocket URL：

```
wss://你的域名/rdp/{服务器ID}
```

## 🔧 使用方式

### 方式一：使用支持WebSocket的RDP客户端

目前需要专用的RDP客户端工具来连接WebSocket URL。推荐的工具：

1. **wscat + RDP客户端组合**
2. **自定义WebSocket转RDP桥接工具**

### 方式二：本地桥接脚本

创建一个本地脚本，监听本地端口并转发到WebSocket：

```javascript
// 示例Node.js脚本
const WebSocket = require('ws');
const net = require('net');

const WS_URL = 'wss://你的域名/rdp/{服务器ID}';
const LOCAL_PORT = 13389;

// 创建本地TCP服务器
const server = net.createServer((socket) => {
    const ws = new WebSocket(WS_URL);
    
    ws.on('open', () => {
        console.log('WebSocket连接已建立');
    });
    
    // TCP -> WebSocket
    socket.on('data', (data) => {
        if (ws.readyState === WebSocket.OPEN) {
            ws.send(data);
        }
    });
    
    // WebSocket -> TCP
    ws.on('message', (data) => {
        socket.write(data);
    });
    
    socket.on('close', () => {
        ws.close();
    });
    
    ws.on('close', () => {
        socket.end();
    });
});

server.listen(LOCAL_PORT, () => {
    console.log(`本地RDP桥接服务运行在端口 ${LOCAL_PORT}`);
    console.log(`使用RDP客户端连接: localhost:${LOCAL_PORT}`);
});
```

然后使用Windows远程桌面连接到 `localhost:13389`

## ⚙️ 环境变量配置

可以通过环境变量启用RDP功能：

| 变量名 | 说明 | 默认值 | 示例 |
|--------|------|--------|------|
| `rdp` 或 `RDP` | RDP服务器列表（可选） | 无 | 参见下方格式 |

### RDP服务器列表格式

```
服务器名称:地址:端口,服务器名称2:地址2:端口2
```

例如：
```
办公服务器:192.168.1.100:3389,测试服务器:test.example.com:3389
```

## 📡 API端点

### 获取服务器列表

```
GET https://你的域名/{UUID}/api/rdp-servers
```

响应示例：
```json
{
    "success": true,
    "servers": [
        {
            "id": "abc123",
            "name": "办公服务器",
            "host": "192.168.1.100",
            "port": 3389,
            "addedAt": "2025-12-14T00:00:00.000Z"
        }
    ]
}
```

### 添加服务器

```
POST https://你的域名/{UUID}/api/rdp-servers
Content-Type: application/json

{
    "name": "服务器名称",
    "host": "192.168.1.100",
    "port": 3389
}
```

### 删除服务器

```
DELETE https://你的域名/{UUID}/api/rdp-servers/{服务器ID}
```

## 🔒 安全说明

1. **路径保护**：所有RDP管理接口都需要正确的UUID才能访问
2. **临时存储**：服务器列表存储在Workers运行时内存中，重启后会丢失
3. **建议使用KV存储**：如果需要持久化存储，可以配置Cloudflare KV

## ⚠️ 注意事项

1. **WebSocket限制**：
   - Cloudflare Workers的WebSocket连接有时间限制
   - 长时间无数据传输可能导致连接断开
   - 建议实现心跳机制

2. **性能考虑**：
   - RDP流量会通过Cloudflare网络中转
   - 延迟取决于Workers节点位置和网络质量
   - 适合加速跨国或被限制的RDP访问

3. **不支持UDP**：
   - RDP的UDP传输不支持
   - 仅支持TCP方式的RDP连接

## 🛠️ 故障排除

### 问题：无法连接到管理界面

- 检查UUID是否正确
- 确认URL格式：`https://域名/{UUID}/rdp-admin`
- 检查环境变量配置

### 问题：服务器列表为空

- RDP服务器列表存储在内存中，Workers重启后会丢失
- 需要重新添加服务器或配置环境变量

### 问题：WebSocket连接失败

- 检查Workers是否正常运行
- 确认服务器ID正确
- 检查目标RDP服务器是否可访问

## 📞 技术支持

如果遇到问题，请检查：

1. Cloudflare Workers日志
2. 浏览器开发者工具的网络日志
3. WebSocket连接状态

## 🔄 更新日志

- **2025-12-14**：初始版本发布
  - RDP管理界面
  - 服务器列表管理
  - API端点支持
