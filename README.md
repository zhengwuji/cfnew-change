# CFnew - 终端 v2.7

<div align="center" style="margin-bottom: 20px;">

**语言 / زبان:** [🇨🇳 中文](README.md) | [🇮🇷 فارسی](فارسی.md)

</div>

<div align="center">

**多协议支持 · 自定义路径 · 延迟测试优选**

[![Telegram](https://img.shields.io/badge/Telegram-交流群-blue?logo=telegram)](https://t.me/+ft-zI76oovgwNmRh)
[![Version](https://img.shields.io/badge/Version-2.7-green)]()
[![License](https://img.shields.io/badge/License-MIT-orange)]()

</div>

## ✨ v2.7 核心特性

- 🎭 **多协议支持** - VLESS + Trojan + xhttp，自由切换
- 🛤️ **自定义路径** - 告别UUID路径，自定义访问地址，支持多级路径
- ⚡ **延迟测试** - 内置IP延迟测试，自动获取机场码，多线程并发测试
- 🔄 **订阅转换** - 自定义转换服务，优选类型细粒度控制
- 🎯 **图形化管理** - KV存储，实时配置，无需重新部署
- 🚀 **API管理** - RESTful API，批量操作，动态更新
- 📱 **多客户端支持** - CLASH、SURGE、SING-BOX、LOON、QUANTUMULT X、V2RAY、Shadowrocket、STASH、NEKORAY、V2RAYNG
- 🚀 **应用唤醒** - 点击按钮自动唤醒对应客户端应用
- 🔍 **自动识别** - 根据User-Agent自动识别并返回对应格式
- 🌐 **多语言支持** - 支持中文和波斯语（伊朗语），根据浏览器语言自动切换
- 🖥️ **RDP加速** - 通过WebSocket隧道加速远程桌面连接，支持多种使用方式

---

## 🆕 v2.7 更新内容

- ⚡ **新增延迟测试功能** - 内置IP延迟测试工具，无需外部软件
- 🌍 **自动获取机场码** - 测试时自动获取CF机场码并映射为中文名称
- 🧵 **多线程并发测试** - 支持自定义线程数（1-50），大幅提升测试速度
- 📥 **多种IP来源** - 支持手动输入、CF随机IP生成、URL获取三种方式
- 💾 **浏览器记忆** - 测试设置自动保存到浏览器，刷新不丢失
- ✅ **一键添加优选** - 选中测试结果一键替换优选列表并自动保存
- 🔧 **扣除握手时间** - 延迟测试自动扣除DNS+TLS握手时间，显示真实网络延迟
- 🖥️ **RDP加速功能** - 新增远程桌面加速，支持Web管理、Node.js桥接和V2Ray三种方式

---

### 配套工具

| 类型 | 描述 | 链接 |
| :--- | :--- | :--- |
|  **优选工具** | 根据自己的网络环境选择最适合的IP | https://github.com/byJoey/yx-tools/releases |
|  **文字教程** | 详细的部署与使用说明博客文章 | [https://joeyblog.net/yuanchuang/1146.html](https://joeyblog.net/yuanchuang/1146.html) |
|  **Workers视频教程** | 直观的操作演示和功能讲解 | https://www.youtube.com/watch?v=aYzTr8FafN4 |
|  **Pages视频教程** | 直观的操作演示和功能讲解 | https://www.youtube.com/watch?v=JhVxJChDL-E |
|  **Snippets视频教程** | 直观的操作演示和功能讲解 | https://www.youtube.com/watch?v=xeFeH3Akcu8 |

---

## 📖 详细使用教程

### 🚀 快速开始（5分钟部署）

#### 第一步：准备 Cloudflare 账号
1. 访问 [Cloudflare](https://dash.cloudflare.com/) 并注册/登录账号
2. 进入 **Workers & Pages** 页面

#### 第二步：创建 Worker
1. 点击 **创建应用程序** > **创建 Worker**
2. 给 Worker 起个名字（例如：`my-v2ray`）
3. 点击 **部署**

#### 第三步：上传代码
1. 部署完成后，点击 **编辑代码**
2. 将本项目的 `明文源吗` 文件内容复制粘贴到编辑器中
3. 点击右上角 **保存并部署**

#### 第四步：配置环境变量
1. 在 Worker 页面点击 **设置** > **变量**
2. 添加环境变量（至少需要设置 `u`）：
   - 点击 **添加变量**
   - 变量名：`u`
   - 值：生成一个 UUID（可访问 [UUID Generator](https://www.uuidgenerator.net/)）
   - 点击 **保存**
3. 点击右上角 **保存并部署**

#### 第五步：访问订阅中心
1. 获取 Worker 域名（在 Worker 概览页面）
2. 在浏览器访问：`https://你的worker域名/{你的UUID}`
3. 看到配置界面即部署成功！🎉

---

### 📝 详细部署步骤

#### 方式一：Cloudflare Workers 部署（推荐）

##### 1. 创建 Worker
- 登录 Cloudflare Dashboard
- 进入 **Workers & Pages** > **创建应用程序** > **创建 Worker**
- 输入 Worker 名称，点击**部署**

##### 2. 部署代码
- 在 Worker 详情页，点击 **快速编辑**
- 删除默认代码，粘贴本项目的 `明文源吗` 文件内容
- 点击 **保存并部署**

##### 3. 配置 KV 存储（可选但强烈推荐）

KV 存储用于保存配置，无需重新部署即可修改设置。

**创建 KV 命名空间：**
1. 在 Cloudflare Dashboard 左侧菜单选择 **KV**
2. 点击 **创建命名空间**
3. 输入名称（例如：`CFnew_Config`）
4. 点击 **添加**

**绑定到 Worker：**
1. 返回 Worker 设置页面
2. 选择 **设置** > **变量**
3. 滚动到 **KV 命名空间绑定**
4. 点击 **添加绑定**
   - 变量名：`C`（必须是大写C）
   - KV 命名空间：选择刚创建的命名空间
5. 点击 **保存并部署**

##### 4. 配置环境变量

在 **设置** > **变量** 中添加以下环境变量：

**必需变量：**
| 变量名 | 说明 | 示例值 |
| :--- | :--- | :--- |
| `u` | 访问密钥（UUID格式） | `9ac70987-feda-4925-83a2-9f3328c28f4a` |

**可选变量：**
| 变量名 | 说明 | 示例值 |
| :--- | :--- | :--- |
| `d` | 自定义访问路径 | `/mypath` 或 `/path/to/sub` |
| `p` | ProxyIP 地址 | `proxyip.example.com:443` |
| `s` | SOCKS5 代理 | `user:pass@host:port` |
| `wk` | 手动指定地区 | `SG`, `HK`, `US`, `JP` |
| `yx` | 自定义优选IP/域名 | `1.1.1.1:443#节点1,8.8.8.8:443#节点2` |

> 💡 **提示**：配置了 KV 存储后，这些变量都可以通过网页界面修改，无需重新部署！

---

### 🎯 订阅中心使用教程

#### 访问订阅中心

**方式一：使用 UUID 访问（默认）**
```
https://你的worker域名/{你的UUID}
```

**方式二：使用自定义路径访问（需配置 d 变量）**
```
https://你的worker域名/{自定义路径}
```

例如：
- 设置环境变量 `d = /mypath`
- 访问：`https://你的worker域名/mypath`

#### 订阅中心功能说明

##### 1. 系统状态区域
显示当前 Worker 的运行状态：
- **Worker 地区**：当前 Worker 所在地区
- **检测方式**：自动检测、手动指定或自定义 ProxyIP
- **ProxyIP 状态**：是否配置了自定义 ProxyIP
- **配置存储**：KV 存储状态（已配置/未配置）

##### 2. 获取订阅链接
支持多种客户端：
- **CLASH** - Windows/macOS/Android
- **V2RAYNG** - Android
- **SING-BOX** - 多平台
- **SHADOWROCKET** - iOS
- **QUANTUMULT X** - iOS
- **LOON** - iOS
- **SURGE** - macOS/iOS
- **STASH** - iOS

**使用方法：**
1. 找到对应客户端的按钮
2. 点击按钮自动唤醒应用（移动端）或复制链接（桌面端）
3. 在客户端中添加订阅即可

**订阅链接格式：**
```
https://你的worker域名/{UUID或自定义路径}/sub?target={客户端类型}
```

##### 3. 协议配置
支持三种协议，可自由组合：
- ☑️ **VLESS WebSocket**：默认启用，推荐使用
- ☐ **Trojan WebSocket**：可选启用，支持自定义密码
- ☐ **XHTTP**：可选启用，基于 HTTP POST 的伪装协议

**操作步骤：**
1. 勾选需要启用的协议
2. 如果启用 Trojan，可设置自定义密码（留空则使用 UUID）
3. 点击 **保存协议配置** 按钮

##### 4. 基础配置

**自定义访问路径（d）：**
- 设置后可用自定义路径代替 UUID 访问
- 支持多级路径，如 `/mypath` 或 `/path/to/sub`
- 提高隐蔽性，更易记忆

**自定义 ProxyIP（p）：**
- 设置后所有节点使用该 IP 作为出口
- 格式：`IP:端口` 或 `域名:端口`
- 例如：`proxyip.example.com:443`

**手动指定地区（wk）：**
- 覆盖自动检测的地区
- 可选地区：US、SG、JP、HK、KR、DE、SE、NL、FI、GB
- 注意：配置了 ProxyIP 后此选项不可用

**自定义优选 IP（yx）：**
- 手动添加优选节点
- 格式：`IP:端口#节点名称`（可省略名称）
- 多个节点用逗号分隔
- 例如：`1.1.1.1:443#香港节点,8.8.8.8:53#美国节点`

##### 5. 延迟测试功能

**功能特点：**
- 内置 IP 延迟测试，无需外部软件
- 支持多线程并发测试（1-50 线程）
- 自动扣除 DNS+TLS 握手时间
- 自动获取 CF 机场码并显示中文名称
- 浏览器自动保存设置

**使用步骤：**

1. **选择 IP 来源**
   - **手动输入**：直接输入 IP 或域名，多个用逗号分隔
   - **CF 随机 IP**：从 Cloudflare IP 段随机生成
   - **从 URL 获取**：从远程 URL 获取 IP 列表

2. **配置测试参数**
   - 测试端口：默认 443（可修改为其他端口）
   - 并发线程数：1-50，默认 5（线程越多速度越快）

3. **开始测试**
   - 点击 **开始测试** 按钮
   - 等待测试完成，查看结果

4. **查看结果**
   测试结果包含：
   - IP 地址
   - 延迟（毫秒）
   - CF 机场码（如 SJC、LAX）
   - 中文地区名（如圣何塞、洛杉矶）

5. **添加优选**
   - 勾选满意的 IP
   - 点击 **添加选中IP到优选列表**
   - 自动替换现有优选列表并保存

##### 6. 高级配置

**订阅转换地址（scu）：**
- 自定义订阅转换服务 URL
- 默认：`https://url.v1.mk/sub`

**优选控制：**
- ☑️ **启用优选域名**：使用优选域名节点
- ☑️ **启用优选 IP**：使用优选 IP 节点
- ☑️ **启用 GitHub 默认优选**：使用 GitHub 提供的优选列表

**SOCKS5 配置（s）：**
- 格式：`user:pass@host:port` 或 `host:port`
- 将所有出站流量通过 SOCKS5 代理转发

**优选 IP 来源 URL（yxURL）：**
- 自定义优选 IP 列表来源
- 默认：GitHub 优选 IP 列表

**允许 API 管理：**
- 开启后可通过 API 动态管理优选 IP
- 默认关闭，需手动开启

##### 7. 控制选项

**地区匹配（rm）：**
- `默认`：启用地区智能匹配
- `no`：关闭地区匹配

**降级控制（qj）：**
- `默认`：CF 直连失败后不降级
- `no`：启用降级模式（CF 直连 → SOCKS5 → fallback）

**端口控制（dkby）：**
- `默认`：生成 TLS 和非 TLS 节点
- `yes`：仅生成 TLS 节点（443、8443、2053 等端口）

**优选控制（yxby）：**
- `默认`：启用所有优选功能
- `yes`：关闭优选，仅使用原生地址

---

### 🖥️ RDP 加速功能详细教程

RDP 加速功能通过 WebSocket 隧道实现远程桌面加速，特别适合跨国访问和网络受限场景。

#### 功能概述

- ✅ 通过 V2Ray/VLESS 隧道加速 RDP 连接
- ✅ Web 界面管理 RDP 服务器
- ✅ 支持多台服务器同时管理
- ✅ 自动生成 V2Ray 订阅链接
- ✅ 本地端口映射，使用体验与直连相同

#### 使用场景

- 🌍 **跨国访问**：从国内访问国外服务器或反之
- 🔒 **突破限制**：绕过网络封锁访问 RDP
- 🚀 **性能优化**：通过 CDN 节点加速连接
- 🏢 **企业远程办公**：安全稳定的远程接入

#### 完整使用流程

##### 第一步：访问 RDP 管理界面

在浏览器访问：
```
https://你的worker域名/{UUID}/rdp-admin
```

或（使用自定义路径）：
```
https://你的worker域名/{自定义路径}/rdp-admin
```

##### 第二步：添加 RDP 服务器

1. **填写服务器信息**
   - **服务器名称**：便于识别的名称（例如：`办公服务器`）
   - **远程服务器 IP**：RDP 服务器的 IP 地址（例如：`192.168.1.100`）
   - **RDP 端口**：默认 `3389`
   - **本地映射端口**：本地监听端口（例如：`13389`）

2. **点击"添加服务器"**
   - 服务器会出现在下方列表中

3. **查看服务器信息**
   - 服务器列表显示所有已添加的服务器
   - 每个服务器显示名称、地址、端口等信息

##### 第三步：生成 RDP 加速订阅

1. **在订阅中心页面找到"RDP 加速配置"区域**
   
   访问：`https://你的worker域名/{UUID或自定义路径}`

2. **选择远程服务器**
   - 从下拉列表中选择要加速的 RDP 服务器
   - 下拉列表显示所有在 RDP 管理界面添加的服务器

3. **设置连接参数**
   - **RDP 端口**：自动填充服务器的 RDP 端口（可修改）
   - **本地映射端口**：设置本地监听端口（通常设为 `13389`）

4. **生成订阅**
   - 点击 **生成 RDP 加速订阅** 按钮
   - 系统会生成包含 RDP 加速配置的 V2Ray 订阅链接

##### 第四步：导入订阅到 V2Ray 客户端

**Windows 系统（V2RayN）：**

1. 下载并安装 [V2RayN](https://github.com/2dust/v2rayN/releases)

2. 复制生成的订阅链接

3. 在 V2RayN 中：
   - 点击 **订阅** > **订阅设置**
   - 点击 **添加**
   - 粘贴订阅链接
   - 点击 **确定**

4. 更新订阅：
   - 点击 **订阅** > **更新订阅**
   - 等待更新完成

5. 启动代理：
   - 在服务器列表中选择 RDP 加速节点
   - 右键点击 > **设置为活动服务器**
   - 确保 V2RayN 已启动（系统托盘图标显示为彩色）

**macOS/Linux 系统：**

使用支持 V2Ray 的客户端（如 V2RayU、Qv2ray）导入订阅链接。

##### 第五步：连接 RDP

1. **打开远程桌面连接**
   
   Windows：
   - 按 `Win + R`
   - 输入 `mstsc`
   - 回车

   macOS：
   - 使用 Microsoft Remote Desktop

2. **输入连接地址**
   ```
   127.0.0.1:13389
   ```
   或
   ```
   localhost:13389
   ```

3. **输入凭据**
   - 用户名：RDP 服务器的用户名
   - 密码：RDP 服务器的密码

4. **连接成功** 🎉
   - 如果一切配置正确，应该能够成功连接到远程桌面

#### 工作原理

```
RDP客户端 → 本地端口(13389) → V2Ray客户端 → WebSocket隧道 → Cloudflare Worker → 远程RDP服务器(3389)
```

1. RDP 客户端连接到 `localhost:13389`
2. V2Ray 客户端将流量封装到 WebSocket
3. 通过 Cloudflare Worker 的 WebSocket 隧道传输
4. Worker 解包后转发到真实的 RDP 服务器

#### 多服务器配置示例

如果有多台 RDP 服务器，可以使用不同的本地端口：

| 服务器 | 远程地址 | 本地端口 | 连接方式 |
|--------|----------|----------|----------|
| 服务器1 | 192.168.1.100:3389 | 13389 | `localhost:13389` |
| 服务器2 | 192.168.1.101:3389 | 13390 | `localhost:13390` |
| 服务器3 | 10.0.0.50:3389     | 13391 | `localhost:13391` |

#### 常见问题

**Q1: 连接失败怎么办？**
- 确认 V2Ray 客户端已启动并连接成功
- 检查本地端口是否正确（默认 13389）
- 确认远程 RDP 服务器的 IP 和端口正确
- 检查远程服务器防火墙是否允许 RDP 连接

**Q2: 连接速度慢或卡顿？**
- 尝试切换不同的 V2Ray 节点
- 使用延迟测试功能优选更快的 IP
- 检查网络带宽是否充足

**Q3: 能否同时连接多台 RDP 服务器？**
- 可以！为每台服务器设置不同的本地端口
- 在 V2Ray 配置中添加多个 inbound 规则
- 连接时使用对应的本地端口

**Q4: 安全性如何？**
- 使用 TLS 加密传输，安全性高
- 建议 RDP 服务器使用强密码
- 可配置 RDP 服务器只允许特定 IP 访问

**Q5: WebSocket 连接会断开吗？**
- 配置中包含心跳机制，保持连接活跃
- 如遇断开，V2Ray 会自动重连
- 长时间无操作可能需要重新连接 RDP

#### 管理 RDP 服务器

**删除服务器：**
1. 在 RDP 管理界面的服务器列表中
2. 找到要删除的服务器
3. 点击 **删除** 按钮

**通过 API 管理：**

查看所有服务器：
```bash
curl https://你的worker域名/{UUID}/api/rdp-servers
```

添加服务器：
```bash
curl -X POST https://你的worker域名/{UUID}/api/rdp-servers \
  -H "Content-Type: application/json" \
  -d '{"name":"办公服务器","host":"192.168.1.100","port":3389}'
```

删除服务器：
```bash
curl -X DELETE https://你的worker域名/{UUID}/api/rdp-servers/{server-id}
```

---

### 🔧 API 管理（高级功能）

#### 开启 API 功能

1. 访问订阅中心：`https://你的worker域名/{UUID或自定义路径}`
2. 找到 **允许 API 管理** 选项
3. 选择 **开启 API 管理**
4. 点击 **保存**

#### API 端点

##### 1. 查询优选 IP 列表
```bash
GET /{UUID或路径}/api/preferred-ips
```

示例：
```bash
curl https://你的worker域名/{UUID}/api/preferred-ips
```

##### 2. 添加优选 IP

**添加单个 IP：**
```bash
POST /{UUID或路径}/api/preferred-ips
Content-Type: application/json

{
  "ip": "1.2.3.4",
  "port": 443,
  "name": "香港节点"
}
```

示例：
```bash
curl -X POST "https://你的worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"ip":"1.2.3.4","port":443,"name":"香港节点"}'
```

**批量添加 IP：**
```bash
POST /{UUID或路径}/api/preferred-ips
Content-Type: application/json

[
  {"ip": "1.2.3.4", "port": 443, "name": "节点1"},
  {"ip": "5.6.7.8", "port": 8443, "name": "节点2"},
  {"ip": "9.10.11.12", "port": 2053, "name": "节点3"}
]
```

示例：
```bash
curl -X POST "https://你的worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '[
    {"ip":"1.2.3.4","port":443,"name":"节点1"},
    {"ip":"5.6.7.8","port":8443,"name":"节点2"}
  ]'
```

##### 3. 删除优选 IP

**删除所有 IP：**
```bash
DELETE /{UUID或路径}/api/preferred-ips
Content-Type: application/json

{
  "all": true
}
```

示例：
```bash
curl -X DELETE "https://你的worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"all":true}'
```

#### 配合优选工具使用

1. 下载优选工具：https://github.com/byJoey/yx-tools/releases
2. 运行优选测试
3. 使用 API 批量上传测试结果
4. 订阅自动更新为最优 IP

---

### ❓ 常见问题解答

#### 部署相关

**Q: 必须配置 KV 存储吗？**
- 不是必须的，但强烈推荐
- 没有 KV 存储只能通过环境变量配置
- 配置了 KV 可通过网页界面实时修改，无需重新部署

**Q: UUID 格式要求是什么？**
- 标准 UUID 格式：`xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`
- 可在线生成：https://www.uuidgenerator.net/
- 例如：`9ac70987-feda-4925-83a2-9f3328c28f4a`

**Q: 如何修改配置？**
- 方式一（推荐）：通过订阅中心网页界面修改（需配置 KV）
- 方式二：修改环境变量，重新部署

**Q: Worker 域名在哪里查看？**
- Worker 详情页的 **预览** 选项卡
- 格式：`你的worker名称.你的账号.workers.dev`
- 可绑定自定义域名

#### 使用相关

**Q: 订阅链接无法导入？**
- 检查客户端类型是否选择正确
- 确认 UUID 或自定义路径正确
- 尝试直接访问订阅链接查看是否有内容
- 确认 Worker 已正确部署

**Q: 节点无法连接？**
- 检查协议配置是否正确
- 尝试启用/禁用不同协议组合
- 使用延迟测试功能测试 IP 可用性
- 检查客户端 TLS 设置

**Q: 如何获得最快的节点？**
- 使用内置延迟测试功能
- 测试多个 CF 优选 IP
- 将低延迟 IP 添加到优选列表
- 定期更新优选列表

**Q: 自定义路径不生效？**
- 确认环境变量 `d` 已保存
- 路径需要以 `/` 开头
- 保存后需要重新部署 Worker（环境变量方式）
- 使用 KV 配置则无需重新部署

#### RDP 加速相关

**Q: RDP 连接失败？**
- 确认 V2Ray 客户端已启动
- 检查本地端口是否被占用
- 验证远程 RDP 服务器地址和端口
- 确认远程服务器允许 RDP 连接

**Q: RDP 延迟高或卡顿？**
- 切换不同的 CF 优选节点
- 使用延迟测试选择更快的 IP
- 检查本地网络带宽
- 调整 RDP 客户端的性能设置（降低颜色深度、禁用桌面背景等）

**Q: 支持 UDP 模式吗？**
- 不支持，仅支持 TCP 模式
- RDP 的 UDP 功能（如 RemoteFX）无法使用
- 但基本的 RDP 功能完全正常

---

### 部署

加入了千呼万唤的订阅每15分钟自动优选一次

#### 🔧 基础配置
| 变量名 | 值 | 说明 |
| :--- | :--- | :--- |
| `u` | `你的 UUID` | **必需**。用于访问订阅和配置管理界面 |
| `p` | `proxyip` | **可选**。自定义ProxyIP地址和端口 |
| `s` | `你的SOCKS5地址` | **可选**。用于将所有出站流量通过 SOCKS5 代理转发，格式为 `user:pass@host:port` 或 `host:port` |
| `d` | `自定义路径` | **可选**。自定义订阅访问路径，支持多级路径，如 `/mypath` 或 `/path/to/sub`，不填则使用 UUID 路径。如果路径没有以 `/` 开头，会自动补上 |
| `wk` | `地区代码` | **可选**。手动指定Worker地区，如：`SG`、`HK`、`US`、`JP`等 |

#### 🎭 协议配置
| 变量名 | 值 | 说明 |
| :--- | :--- | :--- |
| `ev` | `yes/no` | **可选**。启用VLESS协议（默认启用） |
| `et` | `yes/no` | **可选**。启用Trojan协议（默认禁用） |
| `ex` | `yes/no` | **可选**。启用xhttp协议（默认禁用） |
| `tp` | `自定义密码` | **可选**。Trojan协议密码，留空则使用UUID |

#### 🎯 图形化配置（推荐）
- **KV存储配置**：在Workers中创建KV命名空间，绑定环境变量 `C`
- **访问界面**：部署后访问 `/{你的UUID}` 即可使用图形化配置管理
- **实时生效**：通过界面修改配置无需重新部署，立即生效

#### 🔧 高级控制
| 变量名 | 值 | 说明 |
| :--- | :--- | :--- |
| `yx` | `自定义优选IP/域名` | **可选**。支持节点命名，格式：`1.1.1.1:443#香港节点,8.8.8.8:53#Google DNS` |
| `yxURL` | `优选IP来源URL` | **可选**。自定义优选IP列表来源URL，留空则使用默认地址 |
| `scu` | `订阅转换地址` | **可选**。自定义订阅转换服务URL，默认：`https://url.v1.mk/sub` |
| `epd` | `yes/no` | **可选**。启用优选域名（默认启用） |
| `epi` | `yes/no` | **可选**。启用优选IP（默认启用） |
| `egi` | `yes/no` | **可选**。启用GitHub默认优选（默认启用） |
| `qj` | `no` | **可选**。降级控制，设置为`no`时启用降级模式：CF直连失败→SOCKS5连接→fallback地址 |
| `dkby` | `yes` | **可选**。TLS控制，设置为`yes`时只生成TLS节点，不生成非TLS节点（如80端口） |
| `yxby` | `yes` | **可选**。优选控制，设置为`yes`时关闭所有优选功能，只使用原生地址，不生成优选IP和域名节点 |
| `rm` | `no` | **可选**。地区匹配控制，设置为`no`时关闭地区智能匹配 |
| `ae` | `yes` | **可选**。API管理开关，设置为`yes`时允许通过API动态管理优选IP（默认关闭） |

#### 📦 KV存储设置（可选但推荐）
1. 在Cloudflare Workers中创建KV命名空间
2. 在Workers设置中绑定KV命名空间，变量名设为 `C`
3. 重新部署Workers
4. 访问 `/{你的UUID}` 即可使用图形化配置管理

#### 🔑 API快速开始
1. https://github.com/byJoey/yx-tools/releases 优选软件
2. **开启API功能**：访问 `/{UUID}` 或 `/{自定义路径}` → 找到"允许API管理"→ 选择"开启API管理"→ 保存
3. **添加单个IP**：
```bash
# 使用UUID路径
curl -X POST "https://your-worker.workers.dev/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"ip": "1.2.3.4", "port": 443, "name": "香港节点"}'

# 使用自定义路径（如果设置了d变量）
curl -X POST "https://your-worker.workers.dev/{自定义路径}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"ip": "1.2.3.4", "port": 443, "name": "香港节点"}'
```
4. **批量添加IP**：
```bash
curl -X POST "https://your-worker.workers.dev/{UUID或自定义路径}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '[
    {"ip": "1.2.3.4", "port": 443, "name": "节点1"},
    {"ip": "5.6.7.8", "port": 8443, "name": "节点2"}
  ]'
```
5. **一键清空**：
```bash
curl -X DELETE "https://your-worker.workers.dev/{UUID或自定义路径}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"all": true}'
```

### 新功能

#### ⚡ 延迟测试功能（v2.7 新增）
- **内置测试工具**：无需外部软件，直接在配置页面测试IP延迟
- **多种IP来源**：
  - 手动输入：直接输入IP或域名，支持批量（逗号分隔）
  - CF随机IP：从Cloudflare IP段随机生成指定数量的IP
  - URL获取：从远程URL获取IP列表进行测试
- **多线程并发**：支持1-50线程并发测试，默认5线程
- **自动获取机场码**：测试成功后自动获取CF机场码（如SJC、LAX等）
- **中文机场名映射**：自动将机场码映射为中文名称（如SJC→圣何塞）
- **真实延迟计算**：自动扣除DNS+TLS握手时间，显示纯网络延迟
- **浏览器记忆**：所有设置（端口、线程数、IP来源、URL等）自动保存到浏览器
- **一键添加优选**：选中测试结果后一键替换优选列表并自动保存到KV

#### 🎭 多协议支持
- **VLESS协议**：默认启用，完整的VLESS支持
- **Trojan协议**：支持Trojan-WS-TLS，自定义密码或使用UUID
- **xhttp协议**：基于HTTP POST的伪装协议
- **协议混用**：支持同时启用多个协议，客户端自动识别
- **协议切换**：图形化界面一键启用/禁用协议
- **独立保存**：协议配置区域新增独立保存按钮，更方便快捷
- **密码管理**：Trojan支持自定义密码，留空自动使用UUID

#### 🛤️ 自定义路径（d变量）
- **路径自定义**：不再使用UUID作为路径，设置你喜欢的路径名
- **多级路径支持**：支持多级路径，如 `/path/to/sub`，灵活组织访问结构
- **自动补全**：如果路径没有以 `/` 开头，系统会自动补上
- **安全增强**：自定义路径后UUID路径自动禁用，提高隐蔽性
- **灵活访问**：`https://worker.dev/mypath/sub` 或 `https://worker.dev/path/to/sub/sub` 更简洁易记
- **动态切换**：通过图形界面随时修改访问路径
- **状态显示**：配置页面实时显示当前使用的路径类型

#### 🎯 图形化配置管理
- **KV存储支持**：使用Cloudflare KV存储持久化配置
- **图形化界面**：访问 `/{你的UUID}` 或 `/{自定义路径}` 即可使用配置管理界面
- **实时配置**：无需重新部署，配置立即生效
- **配置优先级**：KV配置 > 环境变量 > 默认值

#### 🌐 多语言支持
- **自动语言检测**：根据浏览器语言自动选择中文或波斯语
- **手动语言切换**：页面右上角提供语言选择器，可手动切换
- **持久化存储**：用户选择的语言会保存到浏览器，下次访问自动应用
- **RTL支持**：波斯语版本自动启用从右到左（RTL）布局
- **完整翻译**：所有界面文本、提示信息、按钮标签都已翻译

#### 🔄 订阅转换控制
- **自定义转换服务**：支持配置自定义订阅转换URL
- **优选类型控制**：细粒度控制优选域名、优选IP、GitHub优选
- **独立开关**：每种优选类型可单独启用/禁用
- **默认设置**：内置优选域名、优选IP、GitHub默认优选全部启用
- **实时更新**：修改配置后立即生效，无需重新部署

#### 🚀 API动态管理
- **API管理**：通过RESTful API动态管理优选IP，无需修改代码
- **批量上报**：支持一次性批量添加多个优选IP
- **一键清空**：支持清空所有优选IP，快速更新列表
- **安全开关**：默认关闭，需在图形界面手动开启API功能
- **自动合并**：API添加的IP与手动配置的yx变量自动合并
- **实时同步**：API添加的IP立即在配置页面显示
- **API端点**：
  - `GET /{UUID或路径}/api/preferred-ips` - 查询优选IP列表
  - `POST /{UUID或路径}/api/preferred-ips` - 添加优选IP（支持单个/批量）
  - `DELETE /{UUID或路径}/api/preferred-ips` - 删除优选IP（支持单个/全部）

#### 🌍 手动指定地区
- **地区选择**：支持手动指定Worker地区，覆盖自动检测
- **设置方式**：`wk=SG` 或通过图形化界面选择
- **支持地区**：US、SG、JP、HK、KR、DE、SE、NL、FI、GB 
- **智能显示**：系统状态会显示"手动指定地区"而非"自动检测"

#### 🏷️ 优选节点命名
- **自定义名称**：支持为优选节点设置自定义名称
- **格式支持**：`IP:端口#节点名称` 或 `IP:端口`（使用默认名称）
- **示例**：`1.1.1.1:443#香港节点,8.8.8.8:53#Google DNS`
- **默认格式**：未设置名称时自动生成 `自定义优选-IP:端口`

#### 📊 系统状态监控
- **实时检测**：显示Worker地区、检测方式、ProxyIP状态
- **智能匹配**：同地区 → 邻近地区 → 其他地区的选择逻辑
- **状态指示**：可视化显示系统运行状态和配置信息

#### 🔧 高级控制选项
- **地区匹配控制**：`rm=no` 关闭地区智能匹配
- **降级控制**：`qj=no` 启用降级模式（CF直连失败→SOCKS5→fallback）
- **TLS控制**：`dkby=yes` 只生成TLS节点，不生成非TLS节点
- **优选控制**：`yxby=yes` 关闭所有优选功能

#### 🎨 多客户端支持
- **10种客户端**：支持 CLASH、SURGE、SING-BOX、LOON、QUANTUMULT X、V2RAY、Shadowrocket、STASH、NEKORAY、V2RAYNG
- **自动转换**：根据客户端类型自动生成对应配置
- **一键获取**：图形化界面一键生成订阅链接
- **应用唤醒**：点击客户端按钮自动唤醒对应应用，无需手动复制链接
- **自动识别**：根据User-Agent自动识别客户端类型并返回对应格式
- **协议适配**：不同客户端自动适配最佳协议组合
- **ALPN支持**：所有TLS链接自动包含 `h3,h2,http/1.1` 协议协商

#### ⚡ 性能优化
- **智能优选**：每15分钟自动优选一次，保持最佳性能
- **容错机制**：多重备用方案，确保服务稳定性
- **缓存优化**：智能缓存机制，减少重复计算

---

## 🖥️ RDP加速功能

通过WebSocket隧道实现远程桌面协议(RDP)加速，支持跨国访问和网络受限场景。

### 功能特性

- ✅ **Web管理界面** - 图形化添加和管理RDP服务器
- ✅ **WebSocket隧道** - 利用现有VLESS通道传输RDP流量
- ✅ **多种使用方式** - Node.js桥接、V2Ray自动代理等
- ✅ **多服务器支持** - 同时管理多台RDP服务器
- ✅ **安全验证** - UUID路径保护，防止未授权访问

### 使用方式

#### 方式一：Web管理界面（管理服务器）

访问 `https://your-worker.dev/{UUID}/rdp-admin` 进行服务器管理

**功能：**
- 添加RDP服务器（名称、地址、端口）
- 查看服务器列表和WebSocket URL
- 删除不需要的服务器
- 获取连接配置

#### 方式二：Node.js桥接（适合开发测试）

**优点：** 简单直接，适合临时使用  
**缺点：** 需要手动运行，不支持开机自启

**快速开始：**
```bash
# 1. 安装Node.js (https://nodejs.org/)

# 2. 安装依赖
npm install ws

# 3. 配置并运行桥接脚本
node rdp-bridge.js

# 4. 使用远程桌面连接
mstsc /v:localhost:13389
```

**详细教程：** [Windows10-RDP使用指南.md](Windows10-RDP使用指南.md)

#### 方式三：V2Ray自动代理（推荐生产使用）⭐

**优点：**
- ✅ 一次配置，永久使用
- ✅ 开机自启，后台运行
- ✅ 图形化管理（V2RayN）
- ✅ 多服务器轻松配置
- ✅ 性能优异，低延迟

**快速开始：**
```bash
# 1. 下载V2RayN
# https://github.com/2dust/v2rayN/releases

# 2. 编辑配置文件 v2ray-rdp-config.json
# - 修改RDP服务器地址
# - 修改Workers域名
# - 修改UUID

# 3. 导入配置到V2RayN

# 4. 使用远程桌面连接
mstsc /v:localhost:13389
```

**详细教程：** [V2Ray-RDP加速指南.md](V2Ray-RDP加速指南.md)

### 配置文件

| 文件 | 说明 | 用途 |
|------|------|------|
| `rdp-bridge.js` | Node.js桥接脚本 | 开发测试使用 |
| `v2ray-rdp-config.json` | V2Ray配置模板 | 生产环境推荐 |
| `rdp-client.html` | 客户端示例页面 | 使用说明和示例 |
| `Windows10-RDP使用指南.md` | Node.js方式教程 | 详细步骤 |
| `V2Ray-RDP加速指南.md` | V2Ray方式教程 | 完整配置指南 |
| `RDP-README.md` | 功能总览 | API文档和说明 |

### 多服务器配置示例

```json
{
  "inbounds": [
    {"port": 13389, "settings": {"address": "192.168.1.100", "port": 3389}},
    {"port": 13390, "settings": {"address": "192.168.1.101", "port": 3389}},
    {"port": 13391, "settings": {"address": "10.0.0.50", "port": 3389}}
  ]
}
```

连接时使用：
- 服务器1：`localhost:13389`
- 服务器2：`localhost:13390`
- 服务器3：`localhost:13391`

### API管理

#### 获取服务器列表
```bash
curl https://your-worker.dev/{UUID}/api/rdp-servers
```

#### 添加服务器
```bash
curl -X POST https://your-worker.dev/{UUID}/api/rdp-servers \
  -H "Content-Type: application/json" \
  -d '{"name":"办公服务器","host":"192.168.1.100","port":3389}'
```

#### 删除服务器
```bash
curl -X DELETE https://your-worker.dev/{UUID}/api/rdp-servers/{server-id}
```

### 使用场景

- 🌍 **跨国访问** - 加速跨境RDP连接
- 🔒 **突破限制** - 绕过网络封锁
- 🚀 **性能优化** - 通过CDN节点加速
- 🏢 **企业远程办公** - 安全稳定的远程接入

### 注意事项

1. **WebSocket限制** - 长时间无数据可能断开，脚本内置心跳机制
2. **性能考虑** - 延迟取决于到Cloudflare节点的距离
3. **不支持UDP** - RDP的UDP功能无法使用，仅支持TCP模式
4. **安全建议** - 使用强密码，限制访问IP范围

---

### 致谢

  * 本项目基于 [zizifn/edgetunnel](https://github.com/zizifn/edgetunnel) 修改，感谢原作者的贡献。
  * 本项目内置ProxyIP部分  来自CM [[cmliu](https://github.com/cmliu)) ，感谢作者的贡献。
  * 本项目反代IP来着前端独苗kejiland  [[qwer-search](https://github.com/qwer-search)) ，感谢作者的贡献。
  * 本项目在线优选接口来自  [[白嫖哥](https://t.me/bestcfipas)) ，感谢作者的贡献。


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=byJoey/cfnew&type=Timeline)](https://www.star-history.com/#byJoey/cfnew&Timeline&LogScale)
