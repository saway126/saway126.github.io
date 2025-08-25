---
title: "Jekyll Chirpy 테마 우주 돌고래 커스터마이징 도전기 - 글래스모피즘과 테마 토글 구현 여정"
date: 2025-08-25 20:15:00 +0900
categories: [jekyll, theme, customization]
tags: [jekyll, chirpy, theme, customization, glassmorphism, space-theme, dolphin]
---

# 🌌 Jekyll Chirpy 테마 우주 돌고래 커스터마이징 도전기

## 🎯 프로젝트 개요

오늘은 제 Jekyll 블로그의 Chirpy 테마를 **우주와 돌고래** 컨셉으로 커스터마이징하는 작업을 진행했습니다. 단순한 배경 변경이 아닌, **글래스모피즘(Glassmorphism) 효과**와 **테마 ON/OFF 토글 기능**까지 구현하는 것이 목표였습니다.

## 🚀 구현하고자 했던 기능들

### 1. 우주 배경 테마
- **푸르스름한 우주 그라데이션**: 검정 → 진청 → 파랑 → 보라 계열
- **별빛 효과**: 작은 흰 점들로 우주 느낌 연출
- **고정 배경**: `background-attachment: fixed`로 스크롤 시에도 고정

### 2. 글래스모피즘 효과
- **투명한 유리 느낌**: `backdrop-filter: blur()` 활용
- **카드 요소**: 블로그 포스트 카드, 사이드바, 패널 등
- **부드러운 그림자**: `box-shadow`로 입체감 연출

### 3. 테마 토글 시스템
- **ON/OFF 버튼**: 우측 상단에 고정된 토글 버튼
- **상태 저장**: `localStorage`로 사용자 선택 기억
- **즉시 전환**: 테마 변경 시 실시간으로 스타일 적용/제거

## 🛠️ 기술적 구현 과정

### 1단계: Jekyll 로컬 환경 구축
```bash
# Ruby 환경 확인
ruby --version

# Jekyll 설치 및 의존성 설치
bundle install

# 로컬 서버 실행
bundle exec jekyll serve --port 4001
```

### 2단계: Chirpy 테마 구조 파악
```
_includes/
├── head.html          # CSS/JS 로딩, 메타데이터
└── sidebar.html       # 사이드바 구조

_layouts/
└── default.html       # 메인 레이아웃

assets/
├── css/               # 스타일시트
└── js/                # 자바스크립트
```

### 3단계: 커스텀 CSS/JS 삽입
`_includes/head.html`에 우주 테마 관련 코드를 삽입했습니다:

```html
<!-- 우주 돌고래 파도 테마 CSS -->
<link rel="stylesheet" href="/assets/css/space-dolphin-wave-theme.css" />

<!-- 우주 돌고래 파도 테마 JavaScript -->
<script>
  // 테마 토글 시스템
  let isSpaceDolphinThemeActive = false;
  
  // 글래스모피즘 효과 적용
  function applyGlassmorphismEffects() {
    const cards = document.querySelectorAll(".card, .post, .entry, .content");
    cards.forEach(card => {
      card.style.cssText = `
        background: rgba(255, 255, 255, 0.15) !important;
        backdrop-filter: blur(20px) !important;
        border: 2px solid rgba(255, 255, 255, 0.4) !important;
        border-radius: 20px !important;
      `;
    });
  }
</script>
```

## 🎨 CSS 핵심 스타일

### 우주 배경 그라데이션
```css
body {
  background: linear-gradient(135deg, 
    #0a0a0a 0%, 
    #1a1a2e 25%, 
    #16213e 50%, 
    #0f3460 75%, 
    #533483 100%
  ) !important;
  background-attachment: fixed !important;
}
```

### 글래스모피즘 효과
```css
.glassmorphism {
  background: rgba(255, 255, 255, 0.1) !important;
  backdrop-filter: blur(20px) !important;
  -webkit-backdrop-filter: blur(20px) !important;
  border: 2px solid rgba(255, 255, 255, 0.3) !important;
  border-radius: 20px !important;
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5) !important;
}
```

## 🔧 문제 해결 과정

### 1. Jekyll 빌드 오류
**문제**: `SimpleJekyllSearch is not defined` 오류
**해결**: `simple-jekyll-search.min.js` 파일을 `assets/js/` 폴더에 추가

### 2. CSS 우선순위 문제
**문제**: Chirpy 테마의 기본 스타일이 커스텀 스타일을 덮어씀
**해결**: 모든 커스텀 스타일에 `!important` 플래그 추가

### 3. 테마 토글 버튼 위치 문제
**문제**: 버튼이 하단에 고정되어 우측 상단으로 이동하지 않음
**해결**: `position: fixed !important`, `top: 20px !important`, `right: 20px !important` 강제 적용

### 4. 글래스모피즘 효과 미적용
**문제**: 카드 요소들에 글래스모피즘 효과가 제대로 적용되지 않음
**해결**: `cssText` 사용으로 여러 스타일을 한 번에 적용하고, 더 강력한 선택자 사용

## 📱 최종 구현 결과

### ✅ 성공적으로 구현된 기능
1. **우주 배경**: 푸르스름한 그라데이션과 별빛 효과
2. **테마 토글**: 우측 상단 고정 버튼으로 ON/OFF 제어
3. **상태 저장**: 페이지 새로고침 후에도 선택한 테마 유지
4. **반응형 디자인**: 모바일과 데스크톱 모두 지원

### 🔄 테마 전환 동작
- **테마 ON**: 우주 배경 + 글래스모피즘 효과
- **테마 OFF**: Chirpy 기본 다크 테마로 완벽 복원

## 🎯 핵심 학습 포인트

### 1. Jekyll 테마 커스터마이징
- `_includes/head.html`을 통한 CSS/JS 삽입
- 기존 테마 구조를 파괴하지 않고 기능 추가
- `!important`를 활용한 CSS 우선순위 제어

### 2. 글래스모피즘 구현
- `backdrop-filter: blur()` 속성 활용
- `rgba()` 색상으로 투명도 조절
- `box-shadow`로 입체감과 깊이감 연출

### 3. JavaScript 동적 스타일 적용
- `cssText`를 통한 다중 스타일 한 번에 적용
- `localStorage`를 활용한 사용자 설정 저장
- 이벤트 리스너 중복 방지 기법

### 4. CSS 선택자 전략
- 다양한 클래스명으로 요소 포착 범위 확장
- `!important` 플래그로 확실한 스타일 우선순위 확보
- 반응형 디자인을 고려한 미디어 쿼리 활용

## 🚧 아직 해결해야 할 과제

### 1. 글래스모피즘 효과 완벽 적용
- 일부 카드 요소에서 효과가 미약하게 적용됨
- 더 정확한 CSS 선택자와 강력한 스타일 우선순위 필요

### 2. 성능 최적화
- `backdrop-filter` 속성의 성능 영향 최소화
- 애니메이션과 전환 효과의 부드러움 개선

### 3. 브라우저 호환성
- 구형 브라우저에서의 `backdrop-filter` 지원
- 폴리필이나 대체 방안 고려

## 💡 향후 개선 방향

### 1. 애니메이션 효과 강화
- 별빛 깜빡임 효과
- 돌고래 파도 애니메이션
- 마우스 호버 시 인터랙티브 효과

### 2. 테마 다양화
- 계절별 테마 (봄, 여름, 가을, 겨울)
- 시간대별 테마 (낮/밤)
- 사용자 정의 색상 선택 옵션

### 3. 접근성 개선
- 고대비 모드 지원
- 키보드 네비게이션 개선
- 스크린 리더 호환성

## 🎉 마무리

오늘 하루 동안 Jekyll Chirpy 테마를 우주 돌고래 컨셉으로 커스터마이징하는 작업을 진행했습니다. 단순한 배경 변경을 넘어서 글래스모피즘 효과와 테마 토글 시스템까지 구현하면서, Jekyll 테마 커스터마이징의 깊이를 경험할 수 있었습니다.

특히 CSS 우선순위 문제와 JavaScript 동적 스타일 적용에서 많은 시행착오를 겪었지만, `!important` 플래그와 `cssText` 활용법을 통해 해결할 수 있었습니다.

아직 완벽하지는 않지만, 기본적인 우주 테마와 테마 토글 기능은 성공적으로 구현되었습니다. 앞으로 더 많은 개선과 최적화를 통해 완벽한 우주 돌고래 테마를 만들어 나가겠습니다! 🚀🐬✨

---

**작업 완료일**: 2025년 8월 25일  
**작업 시간**: 약 6시간  
**사용 기술**: Jekyll, Chirpy Theme, CSS3, JavaScript, Glassmorphism  
**GitHub**: [김기성의 기술 블로그](https://github.com/username/githubio)
