---
layout: post
title: "[매일매일] 프론트엔드 기술일기: preconnect, preload, prefetch – 리소스 로딩 성능 최적화 3종 세트" 
date: 2025-06-25 19:11:59 +0900
categories: [jekyll, update]
---






프론트엔드 성능 최적화를 고민할 때 꼭 알아야 할 <link> 태그 속성이 있습니다.바로 preconnect, preload, prefetch입니다.이 세 가지는 리소스 "언제, 어떻게 미리 불러올지" 결정하는 데 중요한 역할을 합니다.하나하나 예제와 함께 정리해봅니다.




 



















 



✅ preconnect: 연결만 미리 열어두기




 



외부 리소스 도메인에 대해 네트워크 연결(DNS, TCP, TLS) 을 먼저 열어줍니다.








📌 사용 예시




 




<link rel="preconnect" href="https://cdn.example.com" crossorigin="anonymous">






 



🔍 언제 쓰나?Google Fonts, 외부 CDN, 외부 API 요청이 자주 발생하는 경우실제 리소스 로딩 전에 대기 시간을 줄여 최초 요청 속도 개선




 







 



✅ preload​: 바로 쓸 리소스 미리 받아두기




 



곧 사용할 리소스를 브라우저가 우선적으로 다운로드 하게 합니다.








📌 사용 예시




 




<link rel="preload" href="/fonts/my-font.woff2" as="font" crossorigin="anonymous">






 



🔍 언제 쓰나?웹폰트 (FOUT 현상 방지)영상, 이미지, JS 등 렌더링에 즉시 필요한 리소스




 



as 속성을 꼭 지정해야 리소스 유형을 명확히 알려줄 수 있어요.












 



✅ prefetch: 다음에 쓸 리소스 느긋하게 받아두기




 



곧 필요할 수도 있는 리소스를 여유 있을 때 백그라운드로 로드








📌 사용 예시




 




<!-- 예시: 실제로는 존재하지 않는 파일입니다 -->
<!-- <link rel="prefetch" href="/assets/css/next-page.css" as="style"> -->






 



🔍 언제 쓰나?사용자가 다음 페이지로 이동할 가능성이 높은 경우싱글 페이지 애플리케이션(SPA) 에서 페이지 전환이 부드럽게 되도록 할 때




 







 



📝 요약 비교표




 





속성

역할

리소스 로딩 시점

우선순위

preconnect

네트워크 연결 미리 생성

리소스 요청 전에

🔼 높음

preload

지금 바로 쓸 리소스 미리 로드

초기 렌더링 전

🔼 높음

prefetch

나중에 쓸 리소스 미리 로드

백그라운드 여유 시간에

🔽 낮음






 







 



📚 참고 자료https://web.dev/learn/performance/resource-hints?hl=ko




 








리소스 힌트로 브라우저 지원  |  web.dev
리소스 힌트는 HTML에서 사용할 수 있는 기능 모음으로, 브라우저가 리소스를 더 일찍 로드하거나 리소스 우선순위가 더 높을 수 있도록 지원할 수 있습니다. 이 모듈에서는 페이지를 더 빠르게 로드하는 데 도움이 되는 몇 가지 리소스 힌트를 다룹니다.
web.dev











https://www.youtube.com/watch?v=PLYIrkT4OCg




 















 



✍️ 김기성 – 프론트 성능 최적화도 결국 디테일 싸움입니다.오늘은 <link> 하나로도 사용자 경험을 바꿀 수 있다는 걸 배웠습니다.​#프론트엔드 #HTML #성능최적화 #preconnect #preload #prefetch #매일매일




 
