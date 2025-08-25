/**
 * 🌌 우주 돌고래 테마 - 블로그 배경 애니메이션
 * 우주 공간에서 돌고래가 헤엄치는 아름다운 배경 효과
 */

class SpaceDolphinTheme {
  constructor() {
    this.scene = null;
    this.camera = null;
    this.renderer = null;
    this.dolphin = null;
    this.stars = [];
    this.waves = [];
    this.isInitialized = false;

    // 성능 최적화
    this.animationId = null;
    this.lastTime = 0;
    this.frameCount = 0;

    this.init();
  }

  init() {
    try {
      console.log('🌌 우주 돌고래 테마 초기화 시작...');

      // Three.js가 로드되었는지 확인
      if (typeof THREE === 'undefined') {
        console.warn('Three.js가 로드되지 않았습니다. CDN에서 로드합니다.');
        this.loadThreeJS();
        return;
      }

      this.createScene();
      this.createCamera();
      this.createRenderer();
      this.createStars();
      this.createWaves();
      this.createDolphin();
      this.createLights();
      this.addEventListeners();
      this.animate();

      this.isInitialized = true;
      console.log('✅ 우주 돌고래 테마 초기화 완료!');
    } catch (error) {
      console.error('❌ 우주 돌고래 테마 초기화 실패:', error);
    }
  }

  loadThreeJS() {
    const script = document.createElement('script');
    script.src =
      'https://cdnjs.cloudflare.com/ajax/libs/three.js/r125/three.min.js';
    script.onload = () => {
      console.log('Three.js 로드 완료, 테마 초기화 재시도...');
      setTimeout(() => this.init(), 100);
    };
    document.head.appendChild(script);
  }

  createScene() {
    this.scene = new THREE.Scene();
    this.scene.background = new THREE.Color(0x000011); // 깊은 우주 색상
  }

  createCamera() {
    const aspect = window.innerWidth / window.innerHeight;
    this.camera = new THREE.PerspectiveCamera(75, aspect, 0.1, 1000);
    this.camera.position.set(0, 2, 8);
    this.camera.lookAt(0, 0, 0);
  }

  createRenderer() {
    this.renderer = new THREE.WebGLRenderer({
      alpha: true,
      antialias: true,
    });
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    // 블로그 배경에 추가
    const container = document.createElement('div');
    container.id = 'space-dolphin-background';
    container.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            pointer-events: none;
        `;
    container.appendChild(this.renderer.domElement);
    document.body.appendChild(container);
  }

  createStars() {
    const starGeometry = new THREE.SphereGeometry(0.02, 8, 8);
    const starMaterial = new THREE.MeshBasicMaterial({
      color: 0xffffff,
      transparent: true,
      opacity: 0.8,
    });

    for (let i = 0; i < 200; i++) {
      const star = new THREE.Mesh(starGeometry, starMaterial);
      star.position.set(
        (Math.random() - 0.5) * 100,
        (Math.random() - 0.5) * 100,
        (Math.random() - 0.5) * 100
      );
      star.userData = {
        originalY: star.position.y,
        speed: Math.random() * 0.01 + 0.005,
      };
      this.stars.push(star);
      this.scene.add(star);
    }
  }

  createWaves() {
    const waveGeometry = new THREE.PlaneGeometry(20, 20, 32, 32);
    const waveMaterial = new THREE.MeshBasicMaterial({
      color: 0x0066ff,
      transparent: true,
      opacity: 0.3,
      wireframe: true,
    });

    for (let i = 0; i < 3; i++) {
      const wave = new THREE.Mesh(waveGeometry, waveMaterial);
      wave.position.y = -2 - i * 0.5;
      wave.userData = {
        originalY: wave.position.y,
        speed: 0.02 + i * 0.01,
        amplitude: 0.1 + i * 0.05,
      };
      this.waves.push(wave);
      this.scene.add(wave);
    }
  }

  createDolphin() {
    // 간단한 돌고래 모양 (기본 지오메트리로)
    const bodyGeometry = new THREE.CylinderGeometry(0.3, 0.3, 1.5, 16);
    const bodyMaterial = new THREE.MeshPhongMaterial({
      color: 0x7bb3d1,
      shininess: 100,
    });

    this.dolphin = new THREE.Group();

    // 몸체
    const body = new THREE.Mesh(bodyGeometry, bodyMaterial);
    body.rotation.z = Math.PI / 2;
    this.dolphin.add(body);

    // 꼬리
    const tailGeometry = new THREE.ConeGeometry(0.2, 0.8, 8);
    const tail = new THREE.Mesh(tailGeometry, bodyMaterial);
    tail.position.set(0.8, 0, 0);
    tail.rotation.z = Math.PI / 2;
    this.dolphin.add(tail);

    // 지느러미
    const finGeometry = new THREE.ConeGeometry(0.1, 0.4, 8);
    const fin = new THREE.Mesh(finGeometry, bodyMaterial);
    fin.position.set(0, 0.3, 0);
    fin.rotation.x = Math.PI / 2;
    this.dolphin.add(fin);

    this.dolphin.position.set(-3, 0, 0);
    this.scene.add(this.dolphin);
  }

  createLights() {
    // 주변광
    const ambientLight = new THREE.AmbientLight(0x404040, 0.6);
    this.scene.add(ambientLight);

    // 방향광
    const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8);
    directionalLight.position.set(5, 5, 5);
    this.scene.add(directionalLight);

    // 포인트 라이트 (우주 느낌)
    const pointLight = new THREE.PointLight(0x0066ff, 1, 100);
    pointLight.position.set(0, 5, 0);
    this.scene.add(pointLight);
  }

  addEventListeners() {
    window.addEventListener('resize', () => {
      this.camera.aspect = window.innerWidth / window.innerHeight;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
    });

    // 마우스 움직임에 따른 카메라 반응
    let mouseX = 0,
      mouseY = 0;
    document.addEventListener('mousemove', (event) => {
      mouseX = (event.clientX / window.innerWidth) * 2 - 1;
      mouseY = (event.clientY / window.innerHeight) * 2 - 1;
    });

    // 마우스 움직임을 카메라에 적용
    this.updateCamera = () => {
      if (this.camera) {
        this.camera.position.x += (mouseX * 2 - this.camera.position.x) * 0.01;
        this.camera.position.y += (-mouseY * 2 - this.camera.position.y) * 0.01;
        this.camera.lookAt(0, 0, 0);
      }
    };
  }

  animate() {
    this.animationId = requestAnimationFrame(() => this.animate());

    const time = Date.now() * 0.001;
    this.frameCount++;

    // 성능 최적화: 60fps로 제한
    if (this.frameCount % 2 !== 0) return;

    // 별들 애니메이션
    this.stars.forEach((star) => {
      star.position.y -= star.userData.speed;
      if (star.position.y < -50) {
        star.position.y = 50;
      }

      // 깜빡임 효과
      star.material.opacity = 0.5 + Math.sin(time * 2 + star.position.x) * 0.3;
    });

    // 파도 애니메이션
    this.waves.forEach((wave, index) => {
      const vertices = wave.geometry.attributes.position.array;
      for (let i = 0; i < vertices.length; i += 3) {
        const x = vertices[i];
        const z = vertices[i + 2];
        vertices[i + 1] =
          Math.sin(x + time * wave.userData.speed) * wave.userData.amplitude;
      }
      wave.geometry.attributes.position.needsUpdate = true;
    });

    // 돌고래 애니메이션
    if (this.dolphin) {
      // 헤엄치는 움직임
      this.dolphin.position.x += 0.02;
      if (this.dolphin.position.x > 5) {
        this.dolphin.position.x = -5;
      }

      // 위아래 움직임
      this.dolphin.position.y = Math.sin(time * 2) * 0.3;

      // 회전
      this.dolphin.rotation.y = Math.sin(time) * 0.1;
    }

    // 카메라 움직임 업데이트
    if (this.updateCamera) {
      this.updateCamera();
    }

    // 렌더링
    if (this.renderer && this.scene && this.camera) {
      this.renderer.render(this.scene, this.camera);
    }
  }

  destroy() {
    if (this.animationId) {
      cancelAnimationFrame(this.animationId);
    }

    if (this.renderer) {
      this.renderer.dispose();
      const container = document.getElementById('space-dolphin-background');
      if (container) {
        container.remove();
      }
    }

    this.isInitialized = false;
    console.log('🌌 우주 돌고래 테마 제거됨');
  }
}

// 페이지 로드 후 테마 시작
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    window.spaceDolphinTheme = new SpaceDolphinTheme();
  });
} else {
  window.spaceDolphinTheme = new SpaceDolphinTheme();
}

// 개발자 도구에서 테마 제어
window.spaceDolphinThemeControls = {
  start: () => {
    if (!window.spaceDolphinTheme || !window.spaceDolphinTheme.isInitialized) {
      window.spaceDolphinTheme = new SpaceDolphinTheme();
    }
  },
  stop: () => {
    if (window.spaceDolphinTheme) {
      window.spaceDolphinTheme.destroy();
    }
  },
  toggle: () => {
    if (window.spaceDolphinTheme && window.spaceDolphinTheme.isInitialized) {
      window.spaceDolphinTheme.destroy();
    } else {
      window.spaceDolphinTheme = new SpaceDolphinTheme();
    }
  },
};
