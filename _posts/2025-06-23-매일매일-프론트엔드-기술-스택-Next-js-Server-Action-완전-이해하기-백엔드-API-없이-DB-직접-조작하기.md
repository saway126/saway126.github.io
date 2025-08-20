---
layout: post
title: "[매일매일] 프론트엔드 기술 스택: Next.js Server Action 완전 이해하기 – 백엔드 API 없이 DB 직접 조작하기" 
date: 2025-06-23 18:26:27 +0900
categories: [jekyll, update]
---


















“Next.js에서 클라이언트와 서버 사이의 경계를 무너뜨리는 방법이 있을까?”Server Action을 활용하면 가능합니다. 오늘은 이 기능에 대해 알기 쉽게 정리해봅니다.












 



🔍 Server Action이란?Server Action은 Next.js 13/14에서 도입된 기능으로,서버에서만 실행되는 비동기 함수입니다.클라이언트에서 fetch()로 API를 호출하는 대신,Next 서버 내부 함수를 직접 호출할 수 있습니다.서버에서만 실행되므로, DB 작업, 파일 시스템 접근 등 보안에 민감한 로직을 감출 수 있습니다.




 



📌 핵심 요약"use server" 디렉티브를 붙인 함수는 브라우저에서 직접 호출되지 않고, 서버에서 실행됩니다.












 



🛠️ Server Action 사용 방법✅ 예제 코드




 




// app/actions.ts
'use server';

export async function createReviewAction(data: FormData) {
  const content = data.get("content");
  // 데이터베이스 저장 등의 작업
}






 




// app/page.tsx 또는 클라이언트 컴포넌트
<form action={createReviewAction}>
  <textarea name="content" required />
  <button type="submit">Submit</button>
</form>






 



이처럼 <form>의 action 속성에 서버 액션을 넣으면,폼 제출 시 브라우저는 JS 없이도 서버에 데이터를 전송합니다.




 







 



✅ Server Action의 장점 3가지




 





장점

설명

1️⃣ 서버와의 직접 연결

클라이언트에서 API 호출 없이 Next 서버에서 DB를 직접 조작

2️⃣ 보안성 향상

액션 함수는 브라우저에 포함되지 않아, 민감한 로직이 노출되지 않음

3️⃣ JS 없는 환경 대응

<form> 기반이므로, JS 비활성 상태에서도 폼 동작 가능






 







 



📌 개발 시 유의사항함수에는 반드시 "use server" 선언이 필요합니다.​전달/리턴 가능한 값은 직렬화 가능한 데이터만 가능합니다 (string, number, FormData, 등).​보안 처리는 반드시 별도로 해야 하며, zod나 joi를 활용해 입력 검증을 권장합니다.​Next.js의 revalidatePath()를 활용해 액션 이후 캐시 무효화도 고려해야 합니다.




 







 



🔗 참고 링크https://codingapple.com/unit/nextjs-server-actions/




 





Next.js의 Server actions 기능 - 코딩애플 온라인 강좌
0:00 server actions 쓰는 법 4:18 client component에서 쓰려면 5:27 심심해서 DB에 있던거 출력도 해봄 7:40 폼 전송 후 새로고침하려면 DB에 데이터를 저장, 수정 등을 하고 싶으면 당연히 서버를 거쳐야합니다.  그래서 page.js에 <form>같은 것도 만들고 서버 파일로 이동해서 거기에 API도 작성해놔야하는데 그게 귀찮으면 그냥 page.js 안에서 전부 해결할 수 있는 기능도 있습니다.  Server actions 기능인데 Next.js 13.4 버전 이후부터 사용가능하고 어떻게 쓰는...
codingapple.com











https://nextjs-ko.org/docs/app/building-your-application/data-fetching/server-actions-and-mutations




 





Server Actions and Mutations – Nextjs 한글 문서
Learn how to handle form submissions and data mutations with Next.js.
nextjs-ko.org











​




 
