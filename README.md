# 🌟 71stars 블로그

> **AI와 자동화의 만남** - 기술 블로그

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-71stars%20블로그-blue?style=flat-square)](https://saway126.github.io)
[![Jekyll](https://img.shields.io/badge/Jekyll-4.4.1-red?style=flat-square)](https://jekyllrb.com/)
[![Chirpy Theme](https://img.shields.io/badge/Theme-Chirpy%207.3.1-green?style=flat-square)](https://github.com/cotes2020/jekyll-theme-chirpy)

## 📖 프로젝트 소개

71stars 블로그는 AI와 자동화 기술을 중심으로 한 기술 블로그입니다. 백엔드, 프론트엔드, DevOps 등 다양한 기술 영역의 경험과 지식을 공유하며, 개발자들이 함께 성장할 수 있는 공간을 만들어갑니다.

## ✨ 주요 기능

- 🎨 **Chirpy 테마** - 깔끔하고 모던한 디자인
- 📱 **반응형 웹** - 모든 디바이스에서 최적화된 경험
- 🌙 **다크/라이트 모드** - 사용자 선호도에 따른 테마 전환
- 🔍 **검색 기능** - 빠른 콘텐츠 검색
- 📱 **PWA 지원** - 앱과 같은 사용자 경험
- 🌐 **다국어 지원** - 한국어 중심의 콘텐츠

## 🛠️ 기술 스택

### Backend
- **Jekyll** - 정적 사이트 생성기
- **Ruby** - 프로그래밍 언어
- **GitHub Pages** - 호스팅 플랫폼

### Frontend
- **HTML5/CSS3** - 마크업 및 스타일링
- **JavaScript** - 인터랙티브 기능
- **SCSS** - CSS 전처리기
- **Bootstrap** - UI 프레임워크

### DevOps
- **GitHub Actions** - CI/CD 파이프라인
- **HTML-Proofer** - 품질 검증
- **Jekyll Plugins** - 기능 확장

## 🚀 로컬 개발 환경 설정

### 필수 요구사항
- Ruby 3.2+ 
- Node.js 18+
- Git

### 설치 및 실행

1. **저장소 클론**
```bash
git clone https://github.com/saway126/saway126.github.io.git
cd saway126.github.io
```

2. **의존성 설치**
```bash
bundle install
npm install
```

3. **JavaScript 빌드**
```bash
npm run build
```

4. **로컬 서버 실행**
```bash
bundle exec jekyll serve
```

5. **브라우저에서 확인**
```
http://127.0.0.1:4000
```

## 📁 프로젝트 구조

```
saway126.github.io/
├── _config.yml          # Jekyll 설정 파일
├── _posts/              # 블로그 포스트
├── _tabs/               # 탭 페이지 (About, Archives 등)
├── _includes/           # 재사용 가능한 HTML 컴포넌트
├── _layouts/            # 페이지 레이아웃 템플릿
├── _sass/               # SCSS 스타일 파일
├── assets/              # 정적 자산 (CSS, JS, 이미지)
│   ├── css/            # 컴파일된 CSS
│   ├── js/             # JavaScript 파일
│   └── img/            # 이미지 파일
├── .github/             # GitHub Actions 워크플로우
└── README.md            # 프로젝트 문서
```

## 📝 포스트 작성 가이드

### 새 포스트 생성
```bash
# _posts 폴더에 YYYY-MM-DD-제목.md 형식으로 파일 생성
```

### 포스트 형식
```markdown
---
layout: post
title: "포스트 제목"
date: 2025-01-01 12:00:00 +0900
categories: [카테고리]
tags: [태그1, 태그2]
---

포스트 내용...
```

### 지원하는 기능
- **마크다운** - 기본 텍스트 포맷
- **코드 하이라이팅** - 구문 강조
- **수학 공식** - MathJax 지원
- **다이어그램** - Mermaid 지원
- **이미지** - 반응형 이미지 지원

## 🚀 배포

### 자동 배포
- **GitHub Actions**를 통한 자동 빌드 및 배포
- `main` 브랜치에 푸시 시 자동으로 배포됨
- HTML-Proofer를 통한 품질 검증

### 수동 배포
```bash
bundle exec jekyll build
# _site 폴더의 내용을 웹 서버에 업로드
```

## 🔧 커스터마이징

### 테마 설정
`_config.yml` 파일에서 다음 항목들을 수정할 수 있습니다:

```yaml
title: "71stars 블로그"
tagline: "AI와 자동화의 만남"
description: "AI와 자동화 기술을 중심으로 한 기술 블로그"
url: "https://saway126.github.io"
lang: "ko"
timezone: "Asia/Seoul"
```

### 스타일 커스터마이징
`assets/css/jekyll-theme-chirpy.scss` 파일에 커스텀 CSS를 추가할 수 있습니다.

## 📊 성능 최적화

- **이미지 최적화** - WebP 포맷 지원
- **CSS/JS 압축** - 번들 최적화
- **CDN 활용** - 정적 자산 전송 최적화
- **캐싱 전략** - 브라우저 캐싱 최적화

## 🐛 문제 해결

### 일반적인 문제들

1. **빌드 오류**
   - Ruby 버전 확인 (3.2+ 권장)
   - `bundle install` 재실행

2. **JavaScript 404 오류**
   - `npm run build` 실행 확인
   - `assets/js/dist/` 폴더 존재 확인

3. **HTML-Proofer 오류**
   - 존재하지 않는 이미지 참조 제거
   - 깨진 링크 수정

## 🤝 기여하기

1. 이 저장소를 포크합니다
2. 새로운 기능 브랜치를 생성합니다 (`git checkout -b feature/amazing-feature`)
3. 변경사항을 커밋합니다 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시합니다 (`git push origin feature/amazing-feature`)
5. Pull Request를 생성합니다

## 📄 라이선스

이 프로젝트는 [MIT 라이선스](LICENSE) 하에 배포됩니다.

## 🙏 감사의 말

- [Chirpy Theme](https://github.com/cotes2020/jekyll-theme-chirpy) - 아름다운 Jekyll 테마
- [Jekyll](https://jekyllrb.com/) - 정적 사이트 생성기
- [GitHub Pages](https://pages.github.com/) - 무료 호스팅 서비스

## 📞 연락처

- **GitHub**: [@saway126](https://github.com/saway126)
- **블로그**: [https://saway126.github.io](https://saway126.github.io)
- **이메일**: [이메일 주소]

---

**⭐ 이 프로젝트가 도움이 되었다면 스타를 눌러주세요!**

> **"기술은 사람을 위한 것이어야 합니다"** - 71stars 블로그의 모토
