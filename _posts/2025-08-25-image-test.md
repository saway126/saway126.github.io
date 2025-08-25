---
title: "이미지 렌더링 테스트"
date: 2025-08-25
categories: [Test]
tags: [image, test, jekyll]
---

# 이미지 렌더링 테스트

이 포스트는 이미지가 제대로 렌더링되는지 테스트하기 위한 것입니다.

## 1. 기본 마크다운 이미지

![Spring AOP Flow](/assets/img/posts/backend/spring-aop-flow.svg)

## 2. HTML img 태그

<img src="/assets/img/posts/frontend/js-call-by-reference.svg" alt="JavaScript Call by Reference" width="400">

## 3. 상대 경로 이미지

![Test Image](../assets/img/posts/backend/spring-aop-flow.svg)

## 4. 절대 경로 이미지

![Test Image](/assets/img/posts/frontend/js-call-by-reference.svg)

## 5. 아이콘 테스트

![Home Icon](/assets/img/icons/home.svg)
![Categories Icon](/assets/img/icons/categories.svg)

## 6. 공통 이미지

![Avatar](/assets/img/commons/avatar.jpg)
![Profile](/assets/img/commons/profile.jpg)

---

**결과:**
- 마크다운 이미지: ✅
- HTML img 태그: ✅  
- 상대 경로: ❓
- 절대 경로: ✅
- 아이콘: ✅
- 공통 이미지: ✅
