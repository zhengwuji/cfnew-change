// WebSocket到TCP的桥接工具 - 用于Windows RDP连接
// 使用说明：
// 1. 安装Node.js: https://nodejs.org/
// 2. 打开PowerShell，运行: npm install ws
// 3. 修改下面的WS_URL为你的实际WebSocket地址
// 4. 运行此脚本: node rdp-bridge.js
// 5. 使用Windows远程桌面连接到 localhost:13389

const WebSocket = require('ws');
const net = require('net');

// ========== 配置区域 ==========
// ⚠️ 重要：将下面的URL替换为你的实际WebSocket地址
const WS_URL = 'wss://ccrough-block-ebe1cc.852446634.workers.dev/rdp/{服务器ID}';

// 本地监听端口（RDP客户端将连接这个端口）
const LOCAL_PORT = 13389;

// 心跳间隔（毫秒）- 保持WebSocket连接活跃
const HEARTBEAT_INTERVAL = 30000;

// ========== 桥接服务器 ==========
const server = net.createServer((socket) => {
    console.log('\n✅ 新的RDP客户端连接');
    console.log(`📍 本地地址: ${socket.localAddress}:${socket.localPort}`);

    let ws;
    let heartbeatTimer;

    try {
        // 连接到WebSocket服务器
        console.log('🔄 正在连接到WebSocket服务器...');
        console.log(`🌐 URL: ${WS_URL}`);

        ws = new WebSocket(WS_URL, {
            rejectUnauthorized: false, // 允许自签名证书
            headers: {
                'User-Agent': 'RDP-WebSocket-Bridge/1.0'
            }
        });

        // WebSocket连接成功
        ws.on('open', () => {
            console.log('✅ WebSocket连接已建立');
            console.log('🚀 RDP流量转发已开始...\n');

            // 启动心跳
            heartbeatTimer = setInterval(() => {
                if (ws.readyState === WebSocket.OPEN) {
                    ws.ping();
                    console.log('💓 发送心跳包');
                }
            }, HEARTBEAT_INTERVAL);
        });

        // TCP socket收到数据 -> 转发到WebSocket
        socket.on('data', (data) => {
            if (ws.readyState === WebSocket.OPEN) {
                ws.send(data);
                console.log(`⬆️  TCP->WS: ${data.length} 字节`);
            } else {
                console.log('⚠️  WebSocket未就绪，无法发送数据');
            }
        });

        // WebSocket收到数据 -> 转发到TCP socket
        ws.on('message', (data) => {
            socket.write(data);
            console.log(`⬇️  WS->TCP: ${data.length} 字节`);
        });

        // WebSocket pong响应
        ws.on('pong', () => {
            console.log('💚 收到心跳响应');
        });

        // TCP socket关闭
        socket.on('close', () => {
            console.log('\n❌ RDP客户端断开连接');
            if (heartbeatTimer) {
                clearInterval(heartbeatTimer);
            }
            if (ws) {
                ws.close();
            }
        });

        // TCP socket错误
        socket.on('error', (err) => {
            console.error('❌ TCP Socket错误:', err.message);
            if (heartbeatTimer) {
                clearInterval(heartbeatTimer);
            }
            if (ws) {
                ws.close();
            }
        });

        // WebSocket关闭
        ws.on('close', (code, reason) => {
            console.log(`\n❌ WebSocket连接关闭`);
            console.log(`   状态码: ${code}`);
            if (reason) {
                console.log(`   原因: ${reason}`);
            }
            if (heartbeatTimer) {
                clearInterval(heartbeatTimer);
            }
            socket.end();
        });

        // WebSocket错误
        ws.on('error', (err) => {
            console.error('❌ WebSocket错误:', err.message);
            if (heartbeatTimer) {
                clearInterval(heartbeatTimer);
            }
            socket.end();
        });

    } catch (error) {
        console.error('❌ 创建WebSocket连接失败:', error.message);
        socket.end();
    }
});

// 服务器错误处理
server.on('error', (err) => {
    if (err.code === 'EADDRINUSE') {
        console.error(`❌ 端口 ${LOCAL_PORT} 已被占用`);
        console.error('   请修改 LOCAL_PORT 为其他端口号，或关闭占用该端口的程序');
    } else {
        console.error('❌ 服务器错误:', err.message);
    }
    process.exit(1);
});

// 启动服务器
server.listen(LOCAL_PORT, '127.0.0.1', () => {
    console.log('\n╔════════════════════════════════════════════════════════════╗');
    console.log('║         🎯 RDP WebSocket桥接服务已启动                     ║');
    console.log('╚════════════════════════════════════════════════════════════╝\n');
    console.log(`📡 本地监听地址:  127.0.0.1:${LOCAL_PORT}`);
    console.log(`🌐 WebSocket URL: ${WS_URL}`);
    console.log('\n🖥️  使用方法:');
    console.log(`   1. 打开"远程桌面连接" (mstsc.exe)`);
    console.log(`   2. 输入: localhost:${LOCAL_PORT}`);
    console.log(`   3. 点击"连接"并输入远程服务器的用户名和密码\n`);
    console.log('💡 提示: 按 Ctrl+C 停止此服务\n');
    console.log('⏳ 等待RDP客户端连接...\n');
});

// 优雅退出
process.on('SIGINT', () => {
    console.log('\n\n👋 正在关闭服务...');
    server.close(() => {
        console.log('✅ 服务已关闭');
        process.exit(0);
    });
});

process.on('SIGTERM', () => {
    console.log('\n\n👋 正在关闭服务...');
    server.close(() => {
        console.log('✅ 服务已关闭');
        process.exit(0);
    });
});
