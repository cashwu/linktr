#!/bin/bash

# 創建新的 Liquid Glass 風格個人連結頁面
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cash Wu Link</title>
    
    <!-- Iconify Icons -->
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.7/dist/iconify-icon.min.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            position: relative;
        }

        /* 動態背景 */
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
        }

        .background::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
            animation: float 20s ease-in-out infinite;
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-30px) rotate(0.5deg); }
            66% { transform: translateY(15px) rotate(-0.5deg); }
        }

        /* 主容器 */
        .container {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
        }

        /* 毛玻璃效果 */
        .glass {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        /* 頭像區域 */
        .profile-section {
            text-align: center;
            margin-bottom: 3rem;
        }

        .avatar-container {
            position: relative;
            display: inline-block;
            margin-bottom: 1.5rem;
        }

        .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .avatar:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
        }

        .name {
            font-size: 2rem;
            font-weight: 600;
            color: white;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 0.5rem;
        }

        .subtitle {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.8);
            font-weight: 300;
        }

        /* 連結容器 */
        .links-container {
            width: 100%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        /* 連結卡片 */
        .link-card {
            display: flex;
            align-items: center;
            padding: 1.2rem 1.5rem;
            text-decoration: none;
            color: white;
            border-radius: 16px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .link-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .link-card:hover::before {
            opacity: 1;
        }

        .link-card:hover {
            transform: translateY(-2px) scale(1.02);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
        }

        .link-card:active {
            transform: translateY(0) scale(0.98);
        }

        .link-icon {
            margin-right: 1rem;
            opacity: 0.9;
            transition: all 0.3s ease;
        }

        .link-card:hover .link-icon {
            opacity: 1;
            transform: scale(1.1);
        }

        .link-text {
            flex: 1;
            text-align: center;
            font-size: 1.1rem;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        /* 頁腳 */
        .footer {
            margin-top: 3rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
            font-weight: 300;
        }

        /* 響應式設計 */
        @media (max-width: 480px) {
            .container {
                padding: 1.5rem 1rem;
            }
            
            .name {
                font-size: 1.8rem;
            }
            
            .avatar {
                width: 100px;
                height: 100px;
            }
            
            .links-container {
                max-width: 100%;
            }
            
            .link-card {
                padding: 1rem 1.2rem;
            }
            
            .link-text {
                font-size: 1rem;
            }
        }

        /* 載入動畫 */
        .fade-in {
            animation: fadeInUp 0.6s ease forwards;
        }

        .fade-in:nth-child(1) { animation-delay: 0.1s; }
        .fade-in:nth-child(2) { animation-delay: 0.2s; }
        .fade-in:nth-child(3) { animation-delay: 0.3s; }
        .fade-in:nth-child(4) { animation-delay: 0.4s; }
        .fade-in:nth-child(5) { animation-delay: 0.5s; }
        .fade-in:nth-child(6) { animation-delay: 0.6s; }
        .fade-in:nth-child(7) { animation-delay: 0.7s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* 微妙的脈動效果 */
        .pulse {
            animation: pulse 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.02); }
        }
    </style>
</head>
<body>
    <div class="background"></div>
    
    <div class="container">
        <div class="profile-section">
            <div class="avatar-container">
                <img src="https://avatars.githubusercontent.com/u/4278751?v=4" alt="Cash Wu" class="avatar pulse">
            </div>
            <h1 class="name">Cash Wu</h1>
            <p class="subtitle">Developer & Designer</p>
        </div>

        <div class="links-container">
            <a href="https://blog.cashwu.com" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:blog" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">Blog</span>
            </a>

            <a href="https://www.elephantshine.com" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:design" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">象晴設計工作室</span>
            </a>

            <a href="https://www.facebook.com/cashwugeek" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:facebook" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">FB 粉絲頁</span>
            </a>

            <a href="https://www.threads.net/@cashwugeek" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="simple-icons:threads" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">Threads</span>
            </a>

            <a href="https://x.com/CashWuGeek" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:twitter" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">X (Twitter)</span>
            </a>

            <a href="https://github.com/cashwu" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:github" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">GitHub</span>
            </a>

            <a href="mailto:cashwugeek@icloud.com" target="_blank" rel="noopener" class="link-card glass fade-in">
                <iconify-icon icon="mdi:email" width="28" height="28" class="link-icon"></iconify-icon>
                <span class="link-text">Email</span>
            </a>
        </div>

        <footer class="footer">
            <p>© 2025 Cash Wu</p>
        </footer>
    </div>

    <script>
        // 添加一些互動效果
        document.addEventListener('DOMContentLoaded', function() {
            // 為連結卡片添加點擊波紋效果
            const linkCards = document.querySelectorAll('.link-card');
            
            linkCards.forEach(card => {
                card.addEventListener('click', function(e) {
                    // 創建波紋效果
                    const ripple = document.createElement('div');
                    const rect = card.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: rgba(255, 255, 255, 0.3);
                        border-radius: 50%;
                        transform: scale(0);
                        animation: ripple 0.6s ease-out;
                        pointer-events: none;
                    `;
                    
                    card.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
            
            // 添加 CSS 動畫
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(2);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        });

        // 滑鼠移動視差效果
        document.addEventListener('mousemove', function(e) {
            const cards = document.querySelectorAll('.link-card');
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            
            cards.forEach((card, index) => {
                const speed = (index + 1) * 0.5;
                const xOffset = (x - 0.5) * speed;
                const yOffset = (y - 0.5) * speed;
                
                card.style.transform = `translate(${xOffset}px, ${yOffset}px)`;
            });
        });
    </script>
</body>
</html>
EOF

echo "✅ 新的 Liquid Glass 風格個人連結頁面已創建完成"
echo "🎨 設計特色："
echo "   - Apple Liquid Glass 毛玻璃效果"
echo "   - 動態漸層背景"
echo "   - 流動的背景動畫"
echo "   - 半透明卡片設計"
echo "   - 互動式懸停效果"
echo "   - 點擊波紋動畫"
echo "   - 滑鼠視差效果"
echo "   - 響應式設計"
echo "   - 載入淡入動畫"