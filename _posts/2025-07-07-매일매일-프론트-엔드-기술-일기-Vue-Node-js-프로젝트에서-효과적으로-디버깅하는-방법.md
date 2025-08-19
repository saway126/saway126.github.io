---
layout: post
title: "[매일매일]프론트 엔드 기술 일기: Vue & Node.js 프로젝트에서 효과적으로 디버깅하는 방법" 
date: 2025-07-07 11:32:46 +0900
categories: [jekyll, update]
---






프론트엔드(Vue)와 백엔드(Node.js) 개발을 하면서 디버깅은 매일같이 마주하게 되는 중요한 작업입니다.“디버깅을 잘한다”는 것은 단순히 버그를 고치는 게 아니라, 문제를 빠르게 이해하고 효과적으로 해결해가는 과정이라고 생각합니다.오늘은 Vue & Node.js 기반 프로젝트에서 경험한 실제 사례와 함께, 제가 사용하는 디버깅 노하우를 정리해 봅니다.




 







 



🪧 디버깅 단계 요약




 





단계

내용

1️⃣

오류 메시지 꼼꼼히 읽기

2️⃣

문제를 작은 단위로 격리

3️⃣

정상 흐름과 문제 흐름 비교

4️⃣

공식 문서 및 검증된 자료 활용

5️⃣

디버깅 도구 적극 활용

6️⃣

과정 기록하기






 







 



🔷 실제 프로젝트 오류 사례다음은 제가 실제 프로젝트를 진행하면서 Vue와 Node.js API 연동 중 발생한 에러입니다.




 















에러 메시지를 보면 다음과 같습니다:GET /api/product/company/undefined 400 (Bad Request)GET /api/product/detail/3 500 (Internal Server Error)Vue Router: No match found for location with path "/productRegist"​✅ 이 사례에서 알 수 있는 문제점:백엔드 API 호출 시 undefined가 파라미터로 전달됨 → 프론트 데이터 바인딩 문제특정 ID에 대한 요청에서 500 오류 → 백엔드 서버 로직 문제잘못된 경로로 라우팅 시도 → Vue Router 설정 문제




 







 



🧐 1. 오류 메시지를 꼼꼼히 읽기에러 메시지를 끝까지 읽고, 어디서 무엇 때문에 발생했는지를 정확히 파악합니다.위 사례처럼 undefined나 500이 보이면 원인을 각각 나눠서 확인해야 합니다.




 







 



🪄 2. 문제를 격리하고 좁히기문제가 발생한 부분만 따로 실행해 최소 재현을 시도합니다.예: company_idx 값이 잘 넘어가는지 console.log()로 찍어 확인하거나, API를 Postman으로 따로 호출해 테스트합니다.




 







 



🔍 3. 정상 흐름과 문제 흐름 비교정상 동작과 문제 동작을 순서대로 비교합니다.예시:




 




✅ 정상: 클릭 → company_idx 값 전달 → API 200 → 화면 렌더링
❌ 문제: 클릭 → company_idx undefined → API 400 → 렌더링 실패






 







 



📚 4. 공식 문서와 자료 활용Vue 3 DocsVue Router DocsNode.js Docs




 







 



🧰 5. 디버깅 도구 적극 활용Vue:Vue DevTools로 상태 확인Network 탭에서 HTTP 요청/응답 확인Node.js:터미널 로그 출력Postman으로 API 요청 테스트




 







 



📝 6. 기록하기이 사례처럼 스크린샷과 함께 블로그에 기록해 두면 큰 자산이 됩니다.




 



















 



🪧 요약 다이어그램




 




[문제 발견]
      ↓
[에러 메시지 분석]
      ↓
[문제 격리 → 최소 재현]
      ↓
[정상/문제 흐름 비교]
      ↓
[문서 & 자료 참고 → 도구 활용]
      ↓
[해결 & 기록]
ㅍㅍㅍㅍㅍ





 







 



✍️ 마치며실제 프로젝트에서 발생한 버그를 차근차근 좁혀가며 해결해 나가면 개발 실력도 함께 성장합니다.여러분도 자신만의 디버깅 루틴을 만들어 보세요.




 







 



참고하면 좋을 자료: https://www.youtube.com/watch?v=rHgYy7JrP1c




 











​




 
