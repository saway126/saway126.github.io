---
layout: post
title: "[매일매일] DevOps 기술일기: GitHub Actions HTML-Proofer 오류 해결기 - 블로그 배포 성공까지의 여정"
date: 2025-01-27 15:30:00 +0900
categories: [DevOps, GitHub Actions, CI/CD]
tags: [GitHub Actions, HTML-Proofer, Jekyll, 블로그, 배포, CI/CD]
---

## 🎯 오늘의 학습 목표

오늘은 **GitHub Actions**에서 발생한 **HTML-Proofer 오류**를 하나씩 해결하면서 블로그 배포를 성공시킨 과정을 정리해보겠습니다.

GitHub Pages로 Jekyll 블로그를 배포할 때 자주 발생하는 문제들과 그 해결 방법을 단계별로 정리했습니다.

## 📚 핵심 개념

### 🔍 **HTML-Proofer란?**
HTML-Proofer는 정적 웹사이트의 HTML 파일들을 검사하여 다음 사항들을 확인하는 도구입니다:
- 깨진 내부 링크
- 존재하지 않는 이미지 파일 참조
- 잘못된 HTML 태그 구조
- 누락된 속성들

### 🚀 **GitHub Actions CI/CD**
GitHub Actions는 코드를 GitHub에 푸시할 때마다 자동으로 빌드, 테스트, 배포를 수행하는 CI/CD 파이프라인입니다.

## 💻 실습 예제

### 🚨 **1단계: 첫 번째 오류 - 존재하지 않는 이미지 파일**

**오류 내용:**
```
The job failed because HTML-Proofer found broken internal links, specifically to /assets/img/posts/20190809/pages-source-dark.png
```

**문제 원인:**
`jekyll-theme-chirpy` 폴더의 `2019-08-09-getting-started.md` 파일에서 존재하지 않는 이미지 파일들을 참조하고 있었습니다.

**해결 방법:**
```bash
# .gitignore 파일에 jekyll-theme-chirpy 폴더 추가
jekyll-theme-chirpy/
```

**적용된 수정:**
```markdown
<!-- 기존 (문제가 있던 코드) -->
<!-- GitHub Actions 빌드 소스 이미지 -->
![Build source](/assets/img/posts/devops/2025-01-27-pages-source-light.png){: .light .border .normal w='375' h='140' }
![Build source](/assets/img/posts/devops/2025-01-27-pages-source-dark.png){: .dark .normal w='375' h='140' }

<!-- 수정된 코드 -->
# .gitignore에 jekyll-theme-chirpy/ 추가하여 git이 해당 폴더를 무시하도록 설정
```

### 🚨 **2단계: 두 번째 오류 - 존재하지 않는 CSS 파일**

**오류 내용:**
```
The job failed due to an internal link to /next-page.css that does not exist
```

**문제 원인:**
블로그 포스트에서 `prefetch` 예시로 사용한 `/next-page.css` 파일이 실제로는 존재하지 않았습니다.

**해결 방법:**
```markdown
<!-- 기존 (문제가 있던 코드) -->
<link rel="prefetch" href="/next-page.css" as="style">

<!-- 수정된 코드 -->
<!-- 예시: 실제로는 존재하지 않는 파일입니다 -->
<!-- <link rel="prefetch" href="/assets/css/next-page.css" as="style"> -->
```

### 🚨 **3단계: 세 번째 오류 - 존재하지 않는 폰트 파일**

**오류 내용:**
```
The job failed because your HTML is linking to /fonts/my-font.woff2, but this file does not exist
```

**문제 원인:**
`preload` 예시로 사용한 `/fonts/my-font.woff2` 폰트 파일이 존재하지 않았습니다.

**해결 방법:**
```markdown
<!-- 기존 (문제가 있던 코드) -->
<link rel="preload" href="/fonts/my-font.woff2" as="font" crossorigin="anonymous">

<!-- 수정된 코드 -->
<!-- 예시: 실제로는 존재하지 않는 폰트 파일입니다 -->
<!-- <link rel="preload" href="/fonts/my-font.woff2" as="font" crossorigin="anonymous"> -->
```

### 🚨 **4단계: 네 번째 오류 - HTML 태그 속성 누락**

**오류 내용:**
```
The job failed due to an HTML error: a <link> tag is missing a reference (the href attribute is missing or empty)
```

**문제 원인:**
텍스트 내용에 포함된 `<link>` 태그가 HTML-Proofer에 의해 실제 HTML 태그로 인식되는 문제가 발생했습니다.

**해결 방법:**
```markdown
<!-- 기존 (문제가 있던 코드) -->
프론트엔드 성능 최적화를 고민할 때 꼭 알아야 할 <link> 태그 속성이 있습니다.

<!-- 수정된 코드 -->
프론트엔드 성능 최적화를 고민할 때 꼭 알아야 할 &lt;link&gt; 태그 속성이 있습니다.
```

## 🛠️ 문제 해결 과정 요약

### 📋 **해결한 모든 HTML-Proofer 오류들:**

1. ✅ **`pages-source-dark.png`**: `jekyll-theme-chirpy` 폴더를 `.gitignore`에 추가
2. ✅ **`/next-page.css`**: 존재하지 않는 CSS 파일 참조를 주석 처리
3. ✅ **`/fonts/my-font.woff2`**: 존재하지 않는 폰트 파일 참조를 주석 처리
4. ✅ **`<link>` 태그 `href` 속성 누락**: `jekyll-theme-chirpy` 폴더 완전 제거
5. ✅ **`<link>` 태그 `href` 속성 누락 (블로그 포스트)**: 모든 `<link>` 태그 예시를 주석 처리
6. ✅ **`<link>` 태그 `href` 속성 누락 (텍스트 내용)**: 텍스트 내 `<link>` 태그를 HTML 엔티티로 변환

### 🔧 **사용한 도구들:**
- **Git**: 버전 관리 및 변경사항 추적
- **GitHub Actions**: 자동 빌드 및 배포
- **HTML-Proofer**: HTML 품질 검증
- **Jekyll**: 정적 사이트 생성기

## 🎉 최종 결과

### ✅ **성공적으로 해결된 내용:**
- 모든 HTML-Proofer 오류 해결
- GitHub Actions 워크플로우 성공
- 블로그 정상 배포
- 40+ 개의 블로그 포스트 모두 표시

### 🚀 **배포 성공:**
- **사이트 URL**: https://saway126.github.io
- **배포 상태**: ✅ 성공
- **HTML-Proofer**: ✅ 통과
- **Jekyll 빌드**: ✅ 성공

## 📚 학습한 교훈

### 💡 **1. 예시 코드의 위험성**
블로그 포스트에서 예시로 사용하는 코드가 실제로는 존재하지 않는 파일을 참조하면 HTML-Proofer 오류가 발생할 수 있습니다.

**해결책:**
- 예시 코드는 주석 처리하거나
- 실제로 존재하는 파일을 참조하거나
- HTML 엔티티로 변환하여 태그로 인식되지 않도록 하기

### 💡 **2. .gitignore의 중요성**
사용하지 않는 테마 폴더나 파일들을 `.gitignore`에 추가하여 불필요한 검증을 방지할 수 있습니다.

### 💡 **3. 단계별 문제 해결**
여러 오류가 동시에 발생할 때는 하나씩 차근차근 해결하는 것이 효과적입니다.

## 🔮 향후 개선 방향

### 📈 **품질 향상:**
- 새로운 포스트 작성 시 HTML-Proofer 규칙 준수
- 예시 코드 작성 시 실제 파일 존재 여부 확인
- 정기적인 링크 유효성 검사

### 🚀 **자동화 개선:**
- GitHub Actions 워크플로우 최적화
- HTML-Proofer 설정 커스터마이징
- 배포 전 로컬 테스트 강화

## 📝 마무리

오늘은 GitHub Actions에서 발생한 HTML-Proofer 오류를 하나씩 해결하면서 블로그 배포를 성공시킨 과정을 정리했습니다.

**핵심 포인트:**
1. **예시 코드 주의**: 실제로는 존재하지 않는 파일 참조 금지
2. **단계별 해결**: 한 번에 모든 문제를 해결하려 하지 말고 하나씩 접근
3. **도구 활용**: HTML-Proofer, GitHub Actions 등 적절한 도구 활용
4. **지속적 개선**: 배포 성공 후에도 품질 향상을 위한 노력 지속

이제 `https://saway126.github.io`에서 정상적으로 작동하는 블로그를 확인할 수 있습니다! 🎉

---

## 📚 참고 자료
- [HTML-Proofer 공식 문서](https://github.com/gjtorikian/html-proofer)
- [GitHub Actions 공식 가이드](https://docs.github.com/en/actions)
- [Jekyll 공식 문서](https://jekyllrb.com/docs/)

## ✍️ 김기성 – DevOps도 결국 디테일 싸움입니다

오늘은 GitHub Actions와 HTML-Proofer를 통해 CI/CD 파이프라인의 중요성을 배웠습니다. 작은 HTML 오류 하나가 전체 배포를 막을 수 있다는 것을 경험하면서, 품질 관리의 중요성을 다시 한번 깨달았습니다.

**#DevOps #GitHubActions #HTML-Proofer #Jekyll #블로그 #CI/CD #매일매일**
