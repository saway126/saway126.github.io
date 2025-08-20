# 🌟 71stars 블로그

> AI와 자동화의 만남을 다루는 기술 블로그

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-71stars%20블로그-blue?logo=github)](https://saway126.github.io)
[![Jekyll](https://img.shields.io/badge/Jekyll-3.9.5-red?logo=jekyll)](https://jekyllrb.com/)
[![Chirpy Theme](https://img.shields.io/badge/Theme-Chirpy%20v7.3.1-green)](https://github.com/cotes2020/jekyll-theme-chirpy)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📖 소개

71stars 블로그는 **AI와 자동화 기술**을 중심으로 한 기술 블로그입니다. 백엔드, 프론트엔드, DevOps 등 다양한 기술 영역의 경험과 지식을 공유합니다.

## ✨ 주요 기능

- 🎨 **Chirpy 테마** - 깔끔하고 현대적인 디자인
- 🌙 **다크/라이트 모드** - 사용자 선호도에 따른 테마 전환
- 📱 **반응형 디자인** - 모든 디바이스에서 최적화된 경험
- 🔍 **통합 검색** - 블로그 전체 내용 검색
- 📚 **카테고리 & 태그** - 체계적인 콘텐츠 분류
- 📖 **목차(TOC)** - 긴 글의 쉬운 탐색
- 💬 **댓글 시스템** - 독자와의 소통
- 📊 **웹 분석** - 방문자 통계 및 분석
- 🚀 **PWA 지원** - 앱과 같은 사용자 경험

## 🛠️ 기술 스택

- **정적 사이트 생성기**: [Jekyll](https://jekyllrb.com/) 3.9.5
- **테마**: [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) v7.3.1
- **호스팅**: [GitHub Pages](https://pages.github.com/)
- **CI/CD**: [GitHub Actions](https://github.com/features/actions)
- **프론트엔드**: HTML5, CSS3, JavaScript (ES6+)
- **스타일링**: SCSS, Bootstrap
- **빌드 도구**: Node.js, npm, Rollup

## 🚀 로컬 개발 환경 설정

### 필수 요구사항
- [Ruby](https://www.ruby-lang.org/) 3.2+ (Jekyll 3.9.5 지원)
- [Node.js](https://nodejs.org/) 18+ (JavaScript 빌드용)
- [Git](https://git-scm.com/)

### 설치 및 실행

1. **저장소 클론**
   ```bash
   git clone https://github.com/saway126/saway126.github.io.git
   cd saway126.github.io
   ```

2. **Ruby 의존성 설치**
   ```bash
   gem install bundler
   bundle install
   ```

3. **Node.js 의존성 설치**
   ```bash
   npm install
   ```

4. **JavaScript 자산 빌드**
   ```bash
   npm run build
   ```

5. **Jekyll 서버 실행**
   ```bash
   bundle exec jekyll serve
   ```

6. **브라우저에서 확인**
   - http://localhost:4000 접속

## 📁 프로젝트 구조

```
saway126.github.io/
├── _config.yml              # Jekyll 설정 파일
├── _includes/               # 재사용 가능한 HTML 컴포넌트
├── _layouts/                # 페이지 레이아웃 템플릿
├── _posts/                  # 블로그 포스트 (Markdown)
├── _tabs/                   # 탭 페이지 (About, Archives 등)
├── assets/                  # 정적 자산 (CSS, JS, 이미지)
│   ├── css/                # 스타일시트
│   ├── js/                 # JavaScript 파일
│   └── img/                # 이미지 파일
├── .github/workflows/       # GitHub Actions CI/CD
├── Gemfile                  # Ruby 의존성 관리
└── package.json             # Node.js 의존성 관리
```

## 📝 블로그 포스트 작성

### 새 포스트 생성
```bash
# _posts 폴더에 YYYY-MM-DD-title.md 형식으로 파일 생성
```

### 포스트 프론트매터 예시
```yaml
---
layout: post
title: "포스트 제목"
date: 2025-08-20 10:00:00 +0900
categories: [dev, log]
tags: [jekyll, github-pages]
---
```

## 🔧 커스터마이징

### 테마 설정
- `_config.yml`에서 블로그 제목, 설명, 소셜 링크 등 설정
- `_sass/` 폴더에서 SCSS 변수 및 스타일 커스터마이징

### 레이아웃 수정
- `_layouts/` 폴더에서 페이지 레이아웃 템플릿 수정
- `_includes/` 폴더에서 재사용 가능한 컴포넌트 수정

## 🚀 배포

### 자동 배포 (권장)
- `main` 브랜치에 푸시하면 GitHub Actions가 자동으로 빌드 및 배포
- GitHub Pages에서 `gh-pages` 브랜치를 소스로 사용

### 수동 배포
```bash
# 사이트 빌드
bundle exec jekyll build

# _site 폴더의 내용을 웹 서버에 업로드
```

## 📊 성능 최적화

- **JavaScript 번들링**: Rollup을 통한 코드 최적화
- **CSS 최적화**: PurgeCSS를 통한 사용하지 않는 스타일 제거
- **이미지 최적화**: WebP 형식 지원 및 압축
- **캐싱**: Service Worker를 통한 오프라인 지원

## 🤝 기여하기

1. 이 저장소를 포크
2. 새로운 기능 브랜치 생성 (`git checkout -b feature/amazing-feature`)
3. 변경사항 커밋 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시 (`git push origin feature/amazing-feature`)
5. Pull Request 생성

## 📄 라이선스

이 프로젝트는 [MIT 라이선스](LICENSE) 하에 배포됩니다.

## 🙏 감사의 말

- [Chirpy 테마](https://github.com/cotes2020/jekyll-theme-chirpy) - 아름다운 Jekyll 테마 제공
- [Jekyll](https://jekyllrb.com/) - 정적 사이트 생성기
- [GitHub Pages](https://pages.github.com/) - 무료 호스팅 서비스

## 📞 연락처

- **블로그**: [https://saway126.github.io](https://saway126.github.io)
- **GitHub**: [@saway126](https://github.com/saway126)
- **이메일**: your_email@example.com

---

<div align="center">

**🌟 71stars 블로그에 오신 것을 환영합니다! 🌟**

AI와 자동화의 만남을 다루는 기술 블로그입니다.

</div>
