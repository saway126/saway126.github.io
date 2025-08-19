# 71stars 블로그 - 네이버 블로그 스타일

AI와 자동화의 만남을 주제로 하는 개인 블로그입니다. 네이버 블로그의 디자인을 참고하여 GitHub Pages용으로 커스터마이징되었습니다.

## 🎨 디자인 특징

### 네이버 블로그 스타일
- **네이버 그린 컬러**: `#03c75a`를 메인 컬러로 사용
- **모던한 UI**: 둥근 모서리, 그림자, 호버 효과
- **반응형 디자인**: 모바일과 데스크톱 모두 최적화
- **한국어 폰트**: Noto Sans KR 폰트 사용

### 주요 컴포넌트
- **사이드바**: 프로필, 네비게이션, 소셜 링크
- **탑바**: 검색, 모드 토글, 사용자 메뉴
- **카드 레이아웃**: 포스트 목록, 카테고리, 태그
- **애니메이션**: 부드러운 전환 효과와 호버 애니메이션

## 🚀 기술 스택

- **Jekyll**: 정적 사이트 생성기
- **Chirpy Theme**: 기본 테마 (커스터마이징됨)
- **SCSS**: CSS 전처리기
- **GitHub Pages**: 호스팅 플랫폼

## 📁 프로젝트 구조

```
saway126.github.io/
├── _sass/                    # SCSS 스타일 파일
│   ├── themes/              # 라이트/다크 테마
│   ├── components/          # 컴포넌트 스타일
│   ├── layout/              # 레이아웃 스타일
│   └── pages/               # 페이지별 스타일
├── _layouts/                # Jekyll 레이아웃
├── _posts/                  # 블로그 포스트
├── _includes/               # 재사용 가능한 컴포넌트
└── assets/                  # 정적 자산
```

## 🎯 커스터마이징 내용

### 1. 색상 테마
- 네이버 그린 (`#03c75a`) 메인 컬러 적용
- 라이트/다크 테마 모두 네이버 스타일로 통일
- 투명도와 그라데이션 효과 추가

### 2. 컴포넌트 디자인
- **버튼**: 둥근 모서리, 호버 효과, 그림자
- **카드**: 둥근 모서리, 호버 애니메이션, 그라데이션
- **태그**: 둥근 배지 스타일, 호버 효과
- **폼 요소**: 둥근 입력창, 포커스 효과

### 3. 레이아웃 개선
- **사이드바**: 프로필 섹션, 네비게이션 메뉴
- **탑바**: 검색바, 액션 버튼, 사용자 메뉴
- **메인 컨텐츠**: 그리드/리스트 레이아웃, 페이지네이션

### 4. 애니메이션
- **호버 효과**: 카드 리프트, 이미지 확대
- **전환 애니메이션**: 부드러운 색상/크기 변화
- **로딩 애니메이션**: 스피너, 페이드인 효과

## 🛠️ 설치 및 실행

### 1. 저장소 클론
```bash
git clone https://github.com/saway126/saway126.github.io.git
cd saway126.github.io
```

### 2. 의존성 설치
```bash
bundle install
```

### 3. 로컬 서버 실행
```bash
bundle exec jekyll serve
```

### 4. 빌드
```bash
bundle exec jekyll build
```

## 📱 반응형 디자인

- **데스크톱**: 1200px 이상
- **태블릿**: 768px - 1199px
- **모바일**: 768px 이하

모든 화면 크기에서 최적의 사용자 경험을 제공합니다.

## 🎨 커스터마이징 가이드

### 색상 변경
`_sass/themes/_light.scss`와 `_sass/themes/_dark.scss`에서 CSS 변수를 수정하여 색상을 변경할 수 있습니다.

### 폰트 변경
`_sass/main.scss`에서 Google Fonts URL을 수정하여 폰트를 변경할 수 있습니다.

### 컴포넌트 스타일 수정
각 컴포넌트별로 분리된 SCSS 파일에서 스타일을 수정할 수 있습니다.

## 📝 블로그 포스트 작성

### 새 포스트 생성
```bash
# _posts 폴더에 YYYY-MM-DD-제목.md 파일 생성
---
layout: post
title: "포스트 제목"
date: YYYY-MM-DD HH:MM:SS
categories: [카테고리]
tags: [태그1, 태그2]
---
```

### 마크다운 문법
- **제목**: `#`, `##`, `###` 등
- **강조**: `**굵게**`, `*기울임*`
- **링크**: `[텍스트](URL)`
- **이미지**: `![대체텍스트](이미지URL)`
- **코드**: `` `코드` `` 또는 ```코드 블록```

## 🔧 문제 해결

### 빌드 오류
1. Ruby와 Jekyll 버전 확인
2. `bundle update` 실행
3. `_config.yml` 설정 확인

### 스타일 적용 안됨
1. SCSS 컴파일 확인
2. 브라우저 캐시 삭제
3. CSS 파일 경로 확인

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 연락처

- **GitHub**: [@saway126](https://github.com/saway126)
- **블로그**: [71stars 블로그](https://saway126.github.io)

---

**71stars 블로그** - AI와 자동화의 만남을 담은 공간입니다. 🚀
