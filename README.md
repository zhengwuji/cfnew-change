# CFnew - Cloudflare Workers V2Ray 订阅管理系统 v2.7

<div align="center">

**多协议支持 · 图形化管理 · 自动优选**

[![Telegram](https://img.shields.io/badge/Telegram-交流群-blue?logo=telegram)](https://t.me/+ft-zI76oovgwNmRh)
[![Version](https://img.shields.io/badge/Version-2.7-green)]()
[![License](https://img.shields.io/badge/License-MIT-orange)]()

</div>

---

## 📑 目录

- [特性概览](#特性概览)
- [快速开始](#快速开始)
- [详细部署教程](#详细部署教程)
- [KV 存储配置](#kv-存储配置)
- [环境变量说明](#环境变量说明)
- [订阅中心使用](#订阅中心使用)
- [延迟测试功能](#延迟测试功能)
- [RDP 加速功能](#rdp-加速功能)
- [API 管理](#api-管理)
- [常见问题](#常见问题)

---

## ✨ 特性概览

### 核心功能
- 🎭 **多协议支持** - VLESS、Trojan、xhttp 三种协议自由切换
- 🛤️ **自定义路径** - 支持自定义访问路径，告别冗长 UUID
- ⚡ **延迟测试** - 内置 IP 延迟测试，自动获取 CF 机场码
- 🎯 **图形化管理** - KV 存储，Web 界面实时配置
- 🚀 **API 管理** - RESTful API 批量管理优选 IP
- 🖥️ **RDP 加速** - WebSocket 隧道加速远程桌面连接

### 客户端支持
支持 **10+ 主流客户端**：CLASH、V2RAYNG、SING-BOX、SHADOWROCKET、QUANTUMULT X、LOON、SURGE、STASH、NEKORAY 等

### 性能优化
- 📥 多种 IP 来源：手动输入、CF 随机 IP、URL 获取
- 🧵 多线程并发测试：支持 1-50 线程
- ✅ 一键添加优选：测试结果直接保存
- 🔄 智能优选：每 15 分钟自动优选一次

---

## 🚀 快速开始

### 前提条件
- Cloudflare 账号（免费）
- 一个 UUID（[在线生成器](https://www.uuidgenerator.net/)）

### 五步部署（只需 5 分钟）

#### 第一步：创建 Worker
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 点击左侧菜单 **Workers 和 Pages**
3. 点击 **创建应用程序** > **创建 Worker**
4. 输入名称（如 `my-v2ray`），点击 **部署**

#### 第二步：上传代码
1. 部署后点击 **编辑代码**
2. 复制本项目的 `明文源吗` 文件全部内容
3. 粘贴到编辑器，替换原有代码
4. 点击 **保存并部署**

#### 第三步：配置环境变量
1. 返回 Worker 详情页
2. 点击 **设置** > **变量**
3. 在 **环境变量** 部分点击 **添加变量**
   - 变量名：`u`
   - 值：你的 UUID（如 `9ac70987-feda-4925-83a2-9f3328c28f4a`）
4. 点击 **保存并部署**

#### 第四步：获取 Worker 域名
- 在 Worker 概览页面找到访问地址
- 格式：`https://你的worker名称.你的账号.workers.dev`

#### 第五步：访问订阅中心
在浏览器打开：
```
https://你的worker域名/{你的UUID}
```
看到配置界面即部署成功！🎉

---

## 📚 详细部署教程

### 方式一：Cloudflare Workers（推荐）

#### 1. 创建并部署 Worker

**步骤：**
1. 登录 Cloudflare Dashboard
2. 左侧菜单 **Workers 和 Pages** > **创建应用程序**
3. 选择 **创建 Worker**
4. 输入 Worker 名称，点击 **部署**
5. 部署完成后点击 **编辑代码**
6. 删除默认代码，粘贴本项目 `明文源吗` 文件内容
7. 点击 **保存并部署**

#### 2. 配置 KV 存储（强烈推荐）

KV 存储用于持久化配置，修改配置无需重新部署。

**创建 KV 命名空间：**
1. Cloudflare Dashboard 左侧菜单选择 **KV**
2. 点击 **创建命名空间**
3. 输入名称（如 `CFnew_Config`）
4. 点击 **添加**

**绑定 KV 到 Worker：**
1. 返回 Worker 设置页面
2. 点击 **设置** > **变量**
3. 滚动到 **KV 命名空间绑定** 部分
4. 点击 **添加绑定**
   - **变量名**：`C`（必须是大写字母 C）
   - **KV 命名空间**：选择刚创建的命名空间
5. 点击 **保存并部署**

> ✅ **配置完成后**，所有配置可通过 Web 界面修改，无需重新部署

---

## 💾 KV 存储配置

### 什么是 KV 存储？
KV（Key-Value）存储是 Cloudflare 提供的键值对数据库，用于持久化存储配置数据。

### 为什么需要 KV？
| 对比项 | 不使用 KV | 使用 KV |
|--------|-----------|---------|
| 配置修改 | 需修改环境变量并重新部署 | Web 界面直接修改，立即生效 |
| 用户体验 | 繁琐，需登录 Dashboard | 简单，图形化操作 |
| 配置管理 | 分散在环境变量中 | 集中在一个界面 |
| 推荐程度 | ❌ 不推荐 | ✅ 强烈推荐 |

### 如何配置 KV？

**第一步：创建 KV 命名空间**
```
Dashboard > KV > 创建命名空间 > 输入名称 > 添加
```

**第二步：绑定到 Worker**
```
Worker 设置 > 变量 > KV 命名空间绑定 > 添加绑定
变量名：C（必须大写）
KV 命名空间：选择刚创建的命名空间
保存并部署
```

**第三步：验证**
访问订阅中心，查看 **系统状态** 区域：
- ✅ 显示 "已配置 KV 存储" = 配置成功
- ❌ 显示 "未配置 KV 存储" = 需要检查绑定

### KV 存储的数据
KV 中保存的配置项（所有配置都可通过 Web 界面修改）：
- 协议配置（VLESS、Trojan、xhttp 开关和密码）
- 基础配置（自定义路径、ProxyIP、手动地区）
- 优选配置（自定义优选 IP、订阅转换地址）
- 高级配置（SOCKS5、优选控制、API 开关等）
- RDP 服务器列表

---

## ⚙️ 环境变量说明

环境变量在 **Worker 设置 > 变量** 中配置。配置了 KV 后，大部分变量都可通过 Web 界面修改。

### 必需变量

| 变量名 | 说明 | 示例值 | 备注 |
|--------|------|--------|------|
| `u` | 访问密钥（UUID） | `9ac70987-feda-4925-83a2-9f3328c28f4a` | **必需**，用于订阅路径验证 |

### 基础配置变量

| 变量名 | 说明 | 示例值 | 默认值 |
|--------|------|--------|--------|
| `d` | 自定义访问路径 | `/mypath` 或 `/path/to/sub` | 使用 UUID |
| `p` | ProxyIP 地址 | `proxyip.example.com:443` | 无 |
| `wk` | 手动指定地区 | `SG`、`HK`、`US`、`JP` 等 | 自动检测 |
| `yx` | 自定义优选 IP | `1.1.1.1:443#节点1,8.8.8.8:443#节点2` | 无 |

### 协议配置变量

| 变量名 | 说明 | 可选值 | 默认值 |
|--------|------|--------|--------|
| `ev` | 启用 VLESS 协议 | `yes`/`no` | `yes` |
| `et` | 启用 Trojan 协议 | `yes`/`no` | `no` |
| `ex` | 启用 xhttp 协议 | `yes`/`no` | `no` |
| `tp` | Trojan 密码 | 任意字符串 | 使用 UUID |

### 高级配置变量

| 变量名 | 说明 | 示例/可选值 | 默认值 |
|--------|------|-------------|--------|
| `s` | SOCKS5 代理 | `user:pass@host:port` 或 `host:port` | 无 |
| `scu` | 订阅转换地址 | `https://url.v1.mk/sub` | 默认地址 |
| `yxURL` | 优选 IP 来源 URL | URL 地址 | GitHub 列表 |

### 优选控制变量

| 变量名 | 说明 | 设置为何值生效 | 默认行为 |
|--------|------|----------------|----------|
| `epd` | 启用优选域名 | `yes` 启用 | 启用 |
| `epi` | 启用优选 IP | `yes` 启用 | 启用 |
| `egi` | 启用 GitHub 默认优选 | `yes` 启用 | 启用 |

### 高级控制变量

| 变量名 | 说明 | 设置为何值生效 | 默认行为 |
|--------|------|----------------|----------|
| `rm` | 地区匹配控制 | `no` 关闭匹配 | 启用地区匹配 |
| `qj` | 降级控制 | `no` 启用降级 | 不降级 |
| `dkby` | TLS 控制 | `yes` 仅 TLS 节点 | TLS + 非 TLS |
| `yxby` | 优选控制 | `yes` 关闭所有优选 | 启用优选 |
| `ae` | API 管理 | `yes` 允许 API | 关闭 |

### 配置优先级

当同一配置同时存在于多个地方时，优先级为：
```
KV 存储配置 > 环境变量 > 代码默认值
```

**建议：**
- 使用 KV 存储后，通过 Web 界面管理配置
- 环境变量只配置 `u`（UUID）即可
- 其他配置在订阅中心修改更方便

---

## 🎯 订阅中心使用

### 访问订阅中心

**方式一：UUID 路径（默认）**
```
https://你的worker域名/{UUID}
```

**方式二：自定义路径（需配置 d 变量）**
```
https://你的worker域名/{自定义路径}
```

例如：
- 设置环境变量 `d = /mypath`
- 访问：`https://worker域名/mypath`

### 界面功能详解

#### 1️⃣ 系统状态区域

显示 Worker 当前状态：
- **Worker 地区**：当前 Worker 所在地区（如新加坡）
- **检测方式**：自动检测 / 手动指定 / 自定义 ProxyIP
- **ProxyIP 状态**：是否配置了自定义 ProxyIP
- **KV 存储状态**：已配置 / 未配置

#### 2️⃣ 订阅链接获取

支持的客户端：

| 客户端 | 平台 | 特点 |
|--------|------|------|
| **CLASH** | Windows/macOS/Android | 规则分流强大 |
| **V2RAYNG** | Android | 简单易用 |
| **SING-BOX** | 多平台 | 性能优异 |
| **SHADOWROCKET** | iOS | 功能全面 |
| **QUANTUMULT X** | iOS | 高级规则 |
| **LOON** | iOS | 界面美观 |
| **SURGE** | macOS/iOS | 老牌强大 |
| **STASH** | iOS | CLASH iOS 版 |

**使用方法：**
1. 找到对应客户端按钮
2. 点击按钮（移动端自动唤醒应用，桌面端复制链接）
3. 在客户端添加订阅

**订阅链接格式：**
```
https://worker域名/{UUID或路径}/sub?target={客户端类型}
```

#### 3️⃣ 协议配置

支持三种协议，可任意组合：

| 协议 | 特点 | 推荐场景 |
|------|------|----------|
| **VLESS WebSocket** | 性能好，兼容性强 | 默认推荐 |
| **Trojan WebSocket** | 伪装性好 | 需要更高隐蔽性 |
| **XHTTP** | HTTP POST 伪装 | 特殊网络环境 |

**操作步骤：**
1. 勾选需要启用的协议
2. Trojan 可设置自定义密码（留空使用 UUID）
3. 点击 **保存协议配置**

#### 4️⃣ 基础配置

**自定义访问路径（d）**
- 用自定义路径代替 UUID 访问
- 支持多级路径：`/mypath` 或 `/path/to/sub`
- 提高隐蔽性和易记性

**自定义 ProxyIP（p）**
- 所有节点使用该 IP 作为出口
- 格式：`IP:端口` 或 `域名:端口`
- 例如：`proxyip.example.com:443`

**手动指定地区（wk）**
- 覆盖自动检测的地区
- 可选：US、SG、JP、HK、KR、DE、SE、NL、FI、GB
- 注意：配置 ProxyIP 后此选项不可用

**自定义优选 IP（yx）**
- 手动添加优选节点
- 格式：`IP:端口#节点名称`（名称可省略）
- 多个节点用逗号分隔
- 例如：`1.1.1.1:443#香港,8.8.8.8:53#Google`

#### 5️⃣ 高级配置

**订阅转换地址（scu）**
- 自定义订阅转换服务
- 默认：`https://url.v1.mk/sub`

**优选控制开关**
- ☑️ **启用优选域名** - 使用优选域名节点
- ☑️ **启用优选 IP** - 使用优选 IP 节点
- ☑️ **启用 GitHub 默认优选** - 使用 GitHub 列表

**SOCKS5 配置（s）**
- 格式：`user:pass@host:port` 或 `host:port`
- 所有流量通过 SOCKS5 代理

**优选 IP 来源（yxURL）**
- 自定义优选 IP 列表来源 URL

**API 管理开关**
- 开启后可通过 API 管理优选 IP
- 默认关闭，需手动开启

#### 6️⃣ 控制选项

| 选项 | 默认值 | 设置为 `no` 的效果 | 设置为 `yes` 的效果 |
|------|--------|-------------------|-------------------|
| **地区匹配（rm）** | 启用 | 关闭地区匹配 | - |
| **降级控制（qj）** | 不降级 | 启用降级模式 | - |
| **端口控制（dkby）** | 全端口 | - | 仅 TLS 端口 |
| **优选控制（yxby）** | 启用 | - | 关闭所有优选 |

---

## ⚡ 延迟测试功能

### 功能特点

- ✅ 内置测试工具，无需外部软件
- ✅ 多线程并发（1-50 线程）
- ✅ 自动获取 CF 机场码（SJC、LAX 等）
- ✅ 映射为中文地区名（圣何塞、洛杉矶）
- ✅ 扣除 DNS+TLS 握手时间
- ✅ 浏览器自动保存设置
- ✅ 一键添加到优选列表

### 使用教程

#### 第一步：选择 IP 来源

**方式一：手动输入**
```
直接输入 IP 或域名，多个用逗号分隔
示例：1.1.1.1, 8.8.8.8, cloudflare.com
```

**方式二：CF 随机 IP**
```
从 Cloudflare IP 段随机生成
可设置生成数量（1-100）
```

**方式三：从 URL 获取**
```
从远程 URL 获取 IP 列表
示例：https://example.com/ips.txt
```

#### 第二步：配置测试参数

- **测试端口**：默认 443（HTTPS），可改为其他
- **并发线程**：1-50，默认 5
  - 线程越多速度越快
  - 但过多可能影响准确性

#### 第三步：开始测试

1. 点击 **开始测试** 按钮
2. 等待测试完成（进度条显示）
3. 查看测试结果

#### 第四步：查看结果

测试结果包含：
- **IP 地址** - 测试的 IP
- **延迟** - 毫秒数（已扣除握手时间）
- **机场码** - CF 机场三字码（如 SJC）
- **中文地区** - 自动映射（如圣何塞）
- **状态** - 成功/失败

#### 第五步：添加优选

1. 勾选满意的低延迟 IP
2. 点击 **添加选中 IP 到优选列表**
3. 自动替换现有优选列表
4. 配置立即生效（如已配置 KV）

### 测试技巧

**提高准确性：**
- 多次测试取平均值
- 避免网络高峰期测试
- 线程数不要设置过高（推荐 5-10）

**快速找到最优 IP：**
1. 先用 CF 随机 IP 生成 20-50 个
2. 并发线程设为 10
3. 测试完成后按延迟排序
4. 选择延迟 < 100ms 的 IP 添加

---

## 🖥️ RDP 加速功能

### 功能概述

通过 WebSocket 隧道加速远程桌面连接，适合跨国访问和网络受限场景。

**核心特性：**
- ✅ Web 界面管理 RDP 服务器
- ✅ 支持多台服务器同时管理
- ✅ 自动生成 V2Ray 订阅链接
- ✅ 本地端口映射
- ✅ 使用体验与直连相同

### 工作原理

```
RDP 客户端 → 本地端口(13389) → V2Ray 客户端 → WebSocket 隧道 
→ Cloudflare Worker → 远程 RDP 服务器(3389)
```

### 完整使用流程

#### 第一步：添加 RDP 服务器

1. 在浏览器访问：
   ```
   https://worker域名/{UUID}/rdp-admin
   ```

2. 填写服务器信息：
   - **服务器名称**：便于识别（如 `办公服务器`）
   - **远程 IP**：RDP 服务器 IP（如 `192.168.1.100`）
   - **RDP 端口**：默认 `3389`
   - **本地端口**：本地监听端口（如 `13389`）

3. 点击 **添加服务器**

#### 第二步：生成 RDP 加速订阅

1. 返回订阅中心：`https://worker域名/{UUID}`

2. 找到 **RDP 加速配置** 区域

3. 从下拉列表选择服务器

4. 设置连接参数：
   - RDP 端口：自动填充（可修改）
   - 本地映射端口：`13389`

5. 点击 **生成 RDP 加速订阅**

#### 第三步：导入订阅到 V2Ray

**Windows（V2RayN）：**

1. 下载 [V2RayN](https://github.com/2dust/v2rayN/releases)

2. 复制生成的订阅链接

3. V2RayN 中：
   - **订阅** > **订阅设置**
   - 点击 **添加**
   - 粘贴订阅链接
   - **确定**

4. 更新订阅：
   - **订阅** > **更新订阅**

5. 启动代理：
   - 选择 RDP 加速节点
   - 右键 > **设置为活动服务器**
   - 确保 V2RayN 已启动

**macOS/Linux：**

使用支持 V2Ray 的客户端（V2RayU、Qv2ray）导入订阅。

#### 第四步：连接 RDP

**Windows：**
1. `Win + R` 打开运行
2. 输入 `mstsc`
3. 连接到：`127.0.0.1:13389` 或 `localhost:13389`
4. 输入 RDP 服务器的用户名和密码

**macOS：**
使用 Microsoft Remote Desktop，连接到 `localhost:13389`

### 多服务器配置

可为每台服务器设置不同本地端口：

| 服务器 | 远程地址 | 本地端口 | 连接方式 |
|--------|----------|----------|----------|
| 服务器 1 | 192.168.1.100:3389 | 13389 | `localhost:13389` |
| 服务器 2 | 192.168.1.101:3389 | 13390 | `localhost:13390` |
| 服务器 3 | 10.0.0.50:3389 | 13391 | `localhost:13391` |

### 常见问题

**Q: 连接失败？**
- 确认 V2Ray 客户端已启动
- 检查本地端口是否正确
- 验证远程 RDP 服务器地址和端口
- 检查远程服务器防火墙设置

**Q: 连接速度慢？**
- 使用延迟测试功能优选更快的 IP
- 尝试切换不同 V2Ray 节点
- 检查网络带宽

**Q: 能否同时连接多台服务器？**
- 可以！为每台设置不同本地端口
- 连接时使用对应端口

**Q: 安全性如何？**
- 使用 TLS 加密传输
- 建议 RDP 使用强密码
- 可配置服务器只允许特定 IP

---

## 🔧 API 管理

### 开启 API 功能

1. 访问订阅中心：`https://worker域名/{UUID}`
2. 找到 **允许 API 管理** 选项
3. 选择 **开启 API 管理**
4. 点击 **保存**

### API 端点

#### 1. 查询优选 IP 列表

```bash
GET /{UUID或路径}/api/preferred-ips
```

**示例：**
```bash
curl https://worker域名/{UUID}/api/preferred-ips
```

**响应：**
```json
[
  {"ip": "1.2.3.4", "port": 443, "name": "香港节点"},
  {"ip": "5.6.7.8", "port": 8443, "name": "美国节点"}
]
```

#### 2. 添加优选 IP

**单个 IP：**
```bash
POST /{UUID或路径}/api/preferred-ips
Content-Type: application/json

{
  "ip": "1.2.3.4",
  "port": 443,
  "name": "香港节点"
}
```

**示例：**
```bash
curl -X POST "https://worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"ip":"1.2.3.4","port":443,"name":"香港节点"}'
```

**批量添加：**
```bash
curl -X POST "https://worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '[
    {"ip":"1.2.3.4","port":443,"name":"节点1"},
    {"ip":"5.6.7.8","port":8443,"name":"节点2"},
    {"ip":"9.10.11.12","port":2053,"name":"节点3"}
  ]'
```

#### 3. 删除优选 IP

**删除所有：**
```bash
curl -X DELETE "https://worker域名/{UUID}/api/preferred-ips" \
  -H "Content-Type: application/json" \
  -d '{"all":true}'
```

### 配合优选工具使用

1. 下载优选工具：[yx-tools](https://github.com/byJoey/yx-tools/releases)
2. 运行优选测试
3. 使用 API 批量上传结果
4. 订阅自动更新

---

## ❓ 常见问题

### 部署相关

<details>
<summary><b>Q: 必须配置 KV 存储吗？</b></summary>

不是必须的，但**强烈推荐**：
- ❌ 没有 KV：只能通过环境变量配置，修改需重新部署
- ✅ 有 KV：Web 界面实时修改，无需重新部署
</details>

<details>
<summary><b>Q: UUID 格式要求？</b></summary>

标准 UUID 格式：`xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

生成方式：
- 在线生成：https://www.uuidgenerator.net/
- Linux/macOS：`uuidgen`
- Windows PowerShell：`[guid]::NewGuid()`
</details>

<details>
<summary><b>Q: 如何修改配置？</b></summary>

**方式一（推荐）**：通过订阅中心 Web 界面
- 需要先配置 KV 存储
- 修改立即生效，无需重新部署

**方式二**：修改环境变量
- Worker 设置 > 变量 > 修改环境变量
- 点击保存并部署
</details>

<details>
<summary><b>Q: Worker 域名在哪里查看？</b></summary>

Worker 详情页 > **预览** 选项卡

格式：`你的worker名称.你的账号.workers.dev`

也可以绑定自定义域名。
</details>

### 使用相关

<details>
<summary><b>Q: 订阅链接无法导入？</b></summary>

检查项：
1. 客户端类型是否选择正确
2. UUID 或自定义路径是否正确
3. 直接访问订阅链接查看是否有内容
4. 确认 Worker 已正确部署
</details>

<details>
<summary><b>Q: 节点无法连接？</b></summary>

解决方法：
1. 检查协议配置是否正确
2. 尝试启用/禁用不同协议
3. 使用延迟测试功能测试 IP
4. 检查客户端 TLS 设置
</details>

<details>
<summary><b>Q: 如何获得最快的节点？</b></summary>

步骤：
1. 使用内置延迟测试功能
2. 选择 CF 随机 IP，生成 20-50 个
3. 设置并发线程 5-10
4. 将延迟 < 100ms 的 IP 添加到优选列表
5. 定期更新优选列表
</details>

<details>
<summary><b>Q: 自定义路径不生效？</b></summary>

检查：
1. 环境变量 `d` 已保存
2. 路径以 `/` 开头
3. 保存后重新部署（环境变量方式）
4. KV 配置则无需重新部署
</details>

### RDP 加速相关

<details>
<summary><b>Q: RDP 连接失败？</b></summary>

排查步骤：
1. 确认 V2Ray 客户端已启动
2. 检查本地端口是否被占用
3. 验证远程 RDP 服务器地址
4. 确认远程服务器允许 RDP 连接
</details>

<details>
<summary><b>Q: RDP 延迟高或卡顿？</b></summary>

优化方法：
1. 使用延迟测试选择更快的 IP
2. 切换不同 CF 优选节点
3. 检查本地网络带宽
4. 调整 RDP 性能设置（降低颜色深度等）
</details>

<details>
<summary><b>Q: 支持 UDP 模式吗？</b></summary>

不支持，仅支持 TCP 模式。

RDP 的 UDP 功能（如 RemoteFX）无法使用，但基本 RDP 功能完全正常。
</details>

---

## 📚 配套资源

| 类型 | 描述 | 链接 |
|------|------|------|
| **优选工具** | 根据网络环境选择最佳 IP | https://github.com/byJoey/yx-tools/releases |
| **文字教程** | 详细部署与使用说明 | https://joeyblog.net/yuanchuang/1146.html |
| **Workers 视频** | 操作演示和功能讲解 | https://www.youtube.com/watch?v=aYzTr8FafN4 |
| **Pages 视频** | Pages 部署教程 | https://www.youtube.com/watch?v=JhVxJChDL-E |

---

## 🙏 致谢

本项目基于以下开源项目：
- [zizifn/edgetunnel](https://github.com/zizifn/edgetunnel) - 感谢原作者
- [cmliu](https://github.com/cmliu) - ProxyIP 部分
- [qwer-search](https://github.com/qwer-search) - 反代 IP（kejiland）
- [白嫖哥](https://t.me/bestcfipas) - 在线优选接口

---

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=byJoey/cfnew&type=Timeline)](https://www.star-history.com/#byJoey/cfnew&Timeline&LogScale)

---

<div align="center">

**如果觉得有帮助，请给个 ⭐ Star 支持一下！**

[🐛 报告问题](https://github.com/byJoey/cfnew/issues) · [💬 加入讨论](https://t.me/+ft-zI76oovgwNmRh)

</div>
