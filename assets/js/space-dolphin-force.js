// 우주 돌고래 파도 테마 - 강제 적용 JavaScript
// Chirpy 테마를 무시하고 DOM에 직접 삽입

(function () {
  'use strict';

  // 페이지가 완전히 로드된 후 실행
  function waitForChirpy() {
    // Chirpy 테마가 로드될 때까지 대기
    if (
      document.querySelector('#main-wrapper') &&
      document.querySelector('.sidebar')
    ) {
      console.log('🌌 Chirpy 테마 감지됨! 우주 돌고래 파도 테마 적용 시작...');
      applySpaceDolphinTheme();
    } else {
      setTimeout(waitForChirpy, 100);
    }
  }

  // 우주 돌고래 파도 테마 적용
  function applySpaceDolphinTheme() {
    console.log('🚀 우주 돌고래 파도 테마 적용 중...');

    // 1. CSS 스타일 강제 삽입
    injectForceCSS();

    // 2. 우주 배경 HTML 삽입
    injectSpaceBackground();

    // 3. 테마 컨트롤 버튼 삽입
    injectThemeControls();

    // 4. 글래스모피즘 효과 적용
    applyGlassmorphism();

    console.log('✅ 우주 돌고래 파도 테마 적용 완료!');
  }

  // 강제 CSS 스타일 삽입
  function injectForceCSS() {
    const style = document.createElement('style');
    style.id = 'space-dolphin-force-styles';
    style.textContent = `
            /* 우주 돌고래 파도 테마 - 강제 적용 */
            html, body {
                background: linear-gradient(135deg, #0c0c0c 0%, #1a1a2e 25%, #16213e 50%, #0f3460 75%, #533483 100%) !important;
                background-attachment: fixed !important;
            }

            .space-dolphin-wave-background {
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
                width: 100vw !important;
                height: 100vh !important;
                z-index: 999999 !important;
                pointer-events: none !important;
                overflow: hidden !important;
            }

            .space-background {
                position: absolute !important;
                top: 0 !important;
                left: 0 !important;
                width: 100% !important;
                height: 100% !important;
                background: linear-gradient(135deg, #0c0c0c 0%, #1a1a2e 25%, #16213e 50%, #0f3460 75%, #533483 100%) !important;
                animation: spaceShift 20s ease-in-out infinite !important;
            }

            @keyframes spaceShift {
                0%, 100% { opacity: 1; }
                50% { opacity: 0.8; }
            }

            .stars-container {
                position: absolute !important;
                width: 100% !important;
                height: 100% !important;
            }

            .star {
                position: absolute !important;
                width: 4px !important;
                height: 4px !important;
                background: white !important;
                border-radius: 50% !important;
                animation: twinkle 3s ease-in-out infinite !important;
                box-shadow: 0 0 8px white !important;
            }

            .star:nth-child(1) { top: 10%; left: 20%; animation-delay: 0s; }
            .star:nth-child(2) { top: 15%; left: 80%; animation-delay: 0.5s; }
            .star:nth-child(3) { top: 25%; left: 40%; animation-delay: 1s; }
            .star:nth-child(4) { top: 35%; left: 70%; animation-delay: 1.5s; }
            .star:nth-child(5) { top: 45%; left: 10%; animation-delay: 2s; }
            .star:nth-child(6) { top: 55%; left: 90%; animation-delay: 2.5s; }
            .star:nth-child(7) { top: 65%; left: 30%; animation-delay: 0.3s; }
            .star:nth-child(8) { top: 75%; left: 60%; animation-delay: 0.8s; }
            .star:nth-child(9) { top: 85%; left: 15%; animation-delay: 1.3s; }
            .star:nth-child(10) { top: 95%; left: 85%; animation-delay: 1.8s; }

            @keyframes twinkle {
                0%, 100% { opacity: 0.3; transform: scale(1); }
                50% { opacity: 1; transform: scale(1.3); }
            }

            .space-waves {
                position: absolute !important;
                bottom: 0 !important;
                width: 100% !important;
                height: 200px !important;
            }

            .wave {
                position: absolute !important;
                bottom: 0 !important;
                left: 0 !important;
                width: 200% !important;
                height: 100% !important;
                background: linear-gradient(45deg, transparent 30%, rgba(0, 102, 255, 0.5) 50%, transparent 70%) !important;
                animation: waveMove 8s linear infinite !important;
            }

            .wave:nth-child(1) { animation-delay: 0s; opacity: 0.9; }
            .wave:nth-child(2) { animation-delay: 2s; opacity: 0.7; }
            .wave:nth-child(3) { animation-delay: 4s; opacity: 0.5; }

            @keyframes waveMove {
                0% { transform: translateX(-50%) translateY(0); }
                100% { transform: translateX(0%) translateY(-20px); }
            }

            .dolphin-container {
                position: absolute !important;
                top: 50% !important;
                left: -100px !important;
                width: 100px !important;
                height: 60px !important;
                animation: dolphinSwim 15s linear infinite !important;
            }

            .dolphin {
                position: relative !important;
                width: 100% !important;
                height: 100% !important;
            }

            .dolphin-body {
                position: absolute !important;
                top: 20px !important;
                left: 20px !important;
                width: 60px !important;
                height: 20px !important;
                background: linear-gradient(45deg, #7bb3d1, #5a9bc9) !important;
                border-radius: 20px !important;
                animation: dolphinBody 2s ease-in-out infinite !important;
            }

            .dolphin-tail {
                position: absolute !important;
                top: 15px !important;
                left: 5px !important;
                width: 20px !important;
                height: 30px !important;
                background: linear-gradient(45deg, #7bb3d1, #5a9bc9) !important;
                border-radius: 10px !important;
                transform: rotate(-15deg) !important;
                animation: dolphinTail 1.5s ease-in-out infinite !important;
            }

            .dolphin-fin {
                position: absolute !important;
                top: 10px !important;
                left: 35px !important;
                width: 15px !important;
                height: 25px !important;
                background: linear-gradient(45deg, #7bb3d1, #5a9bc9) !important;
                border-radius: 8px !important;
                transform: rotate(15deg) !important;
                animation: dolphinFin 1.8s ease-in-out infinite !important;
            }

            @keyframes dolphinSwim {
                0% { left: -100px; }
                100% { left: calc(100vw + 100px); }
            }

            @keyframes dolphinBody {
                0%, 100% { transform: translateY(0) rotate(0deg); }
                50% { transform: translateY(-5px) rotate(2deg); }
            }

            @keyframes dolphinTail {
                0%, 100% { transform: rotate(-15deg); }
                50% { transform: rotate(-25deg); }
            }

            @keyframes dolphinFin {
                0%, 100% { transform: rotate(15deg); }
                50% { transform: rotate(25deg); }
            }

            /* 테마 컨트롤 버튼 */
            .theme-controls {
                position: fixed !important;
                top: 20px !important;
                right: 20px !important;
                z-index: 999999 !important;
                display: flex !important;
                gap: 10px !important;
                background: rgba(0, 0, 0, 0.6) !important;
                padding: 15px !important;
                border-radius: 15px !important;
                backdrop-filter: blur(15px) !important;
                -webkit-backdrop-filter: blur(15px) !important;
                border: 2px solid rgba(255, 255, 255, 0.4) !important;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.6) !important;
            }

            .theme-controls-bottom {
                position: fixed !important;
                bottom: 20px !important;
                left: 20px !important;
                z-index: 999999 !important;
                display: flex !important;
                gap: 10px !important;
                background: rgba(0, 0, 0, 0.6) !important;
                padding: 15px !important;
                border-radius: 15px !important;
                backdrop-filter: blur(15px) !important;
                -webkit-backdrop-filter: blur(15px) !important;
                border: 2px solid rgba(255, 255, 255, 0.4) !important;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.6) !important;
            }

            .theme-btn {
                padding: 12px 20px !important;
                background: rgba(255, 255, 255, 0.4) !important;
                backdrop-filter: blur(10px) !important;
                -webkit-backdrop-filter: blur(10px) !important;
                border: 2px solid rgba(255, 255, 255, 0.5) !important;
                border-radius: 10px !important;
                color: white !important;
                cursor: pointer !important;
                font-size: 16px !important;
                font-weight: bold !important;
                transition: all 0.3s ease !important;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.8) !important;
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.5) !important;
            }

            .theme-btn:hover {
                background: rgba(255, 255, 255, 0.5) !important;
                transform: translateY(-3px) !important;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.6) !important;
            }

            .theme-btn.danger {
                background: rgba(255, 59, 48, 0.5) !important;
                border-color: rgba(255, 59, 48, 0.6) !important;
            }

            .theme-btn.danger:hover {
                background: rgba(255, 59, 48, 0.6) !important;
            }

            /* 글래스모피즘 효과 */
            #main-wrapper, .content, .sidebar, .card, .post, .entry {
                background: rgba(255, 255, 255, 0.1) !important;
                backdrop-filter: blur(10px) !important;
                -webkit-backdrop-filter: blur(10px) !important;
                border: 1px solid rgba(255, 255, 255, 0.2) !important;
                border-radius: 12px !important;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4) !important;
            }

            /* 텍스트 가독성 */
            h1, h2, h3, h4, h5, h6 {
                color: white !important;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.8) !important;
            }

            p, span, div {
                color: rgba(255, 255, 255, 0.95) !important;
            }
        `;

    document.head.appendChild(style);
    console.log('🎨 강제 CSS 스타일 삽입 완료');
  }

  // 우주 배경 HTML 삽입
  function injectSpaceBackground() {
    const backgroundHTML = `
            <div class="space-dolphin-wave-background">
                <div class="space-background"></div>
                <div class="stars-container">
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                    <div class="star"></div>
                </div>
                <div class="space-waves">
                    <div class="wave"></div>
                    <div class="wave"></div>
                    <div class="wave"></div>
                </div>
                <div class="dolphin-container">
                    <div class="dolphin">
                        <div class="dolphin-body"></div>
                        <div class="dolphin-tail"></div>
                        <div class="dolphin-fin"></div>
                    </div>
                </div>
            </div>
        `;

    // body의 첫 번째 자식으로 삽입
    document.body.insertAdjacentHTML('afterbegin', backgroundHTML);
    console.log('🌌 우주 배경 HTML 삽입 완료');
  }

  // 테마 컨트롤 버튼 삽입
  function injectThemeControls() {
    const controlsHTML = `
            <div class="theme-controls">
                <button class="theme-btn" onclick="window.toggleSpaceTheme()">🌌 테마 토글</button>
                <button class="theme-btn danger" onclick="window.resetSpaceTheme()">🔄 테마 리셋</button>
            </div>
            <div class="theme-controls-bottom">
                <button class="theme-btn" onclick="window.toggleSpaceTheme()">🌌 테마 토글</button>
                <button class="theme-btn danger" onclick="window.resetSpaceTheme()">🔄 테마 리셋</button>
            </div>
        `;

    document.body.insertAdjacentHTML('beforeend', controlsHTML);
    console.log('🎛️ 테마 컨트롤 버튼 삽입 완료');
  }

  // 글래스모피즘 효과 적용
  function applyGlassmorphism() {
    const elements = document.querySelectorAll(
      '#main-wrapper, .content, .sidebar, .card, .post, .entry'
    );
    elements.forEach((el) => {
      if (el) {
        el.style.background = 'rgba(255, 255, 255, 0.1)';
        el.style.backdropFilter = 'blur(10px)';
        el.style.webkitBackdropFilter = 'blur(10px)';
        el.style.border = '1px solid rgba(255, 255, 255, 0.2)';
        el.style.borderRadius = '12px';
        el.style.boxShadow = '0 8px 32px rgba(0, 0, 0, 0.4)';
      }
    });
    console.log('✨ 글래스모피즘 효과 적용 완료');
  }

  // 전역 함수 등록
  window.toggleSpaceTheme = function () {
    const background = document.querySelector('.space-dolphin-wave-background');
    if (background) {
      if (background.style.display === 'none') {
        background.style.display = 'block';
        localStorage.setItem('spaceThemeActive', 'true');
        console.log('🌌 우주 돌고래 파도 테마 활성화');
      } else {
        background.style.display = 'none';
        localStorage.setItem('spaceThemeActive', 'false');
        console.log('🌌 우주 돌고래 파도 테마 비활성화');
      }
    }
  };

  window.resetSpaceTheme = function () {
    const background = document.querySelector('.space-dolphin-wave-background');
    if (background) {
      background.style.display = 'block';
      localStorage.setItem('spaceThemeActive', 'true');
      console.log('🔄 우주 돌고래 파도 테마 리셋 완료');
    }
  };

  // 키보드 단축키
  document.addEventListener('keydown', (event) => {
    if (event.ctrlKey && event.key === 't') {
      event.preventDefault();
      window.toggleSpaceTheme();
    }
    if (event.ctrlKey && event.key === 'r') {
      event.preventDefault();
      window.resetSpaceTheme();
    }
  });

  // 페이지 로드 시 테마 상태 복원
  document.addEventListener('DOMContentLoaded', () => {
    const themeActive = localStorage.getItem('spaceThemeActive');
    if (themeActive === 'false') {
      setTimeout(() => {
        const background = document.querySelector(
          '.space-dolphin-wave-background'
        );
        if (background) {
          background.style.display = 'none';
        }
      }, 1000);
    }
  });

  // 시작
  console.log('🚀 우주 돌고래 파도 테마 JavaScript 로드됨');
  waitForChirpy();
})();
