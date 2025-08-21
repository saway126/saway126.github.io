---
layout: post
title: "[매일매일]프론트 엔드 기술 일기:  Content-Type 헤더 완전 이해하기" 
date: 2025-07-11 11:52:12 +0900
categories: [jekyll, update]
---






안녕하세요! 오늘은 HTTP 통신에서 빠질 수 없는 핵심 헤더 중 하나인 Content-Type 에 대해 정리합니다.API 요청을 만들 때, 혹은 서버 응답을 처리할 때 꼭 알아둬야 할 개념이니 차근차근 읽어주세요. 🌱




 















사진 출처: https://velog.io/@vekkary/Content-type%EC%9D%B4%EB%9E%80




 







 



🌟 Content-Type이란?Content-Type 은 HTTP 요청(request)과 응답(response)에서 전송되는 데이터의 타입을 명시하는 헤더입니다.서버와 클라이언트가 데이터를 주고받을 때, 올바르게 해석할 수 있도록 알려주는 역할을 합니다.




 



📌 데이터의 형식을 명확히 지정하지 않으면, 서버/클라이언트가 데이터를 잘못 처리하거나 오류가 발생할 수 있습니다.












 



✨ Content-Type의 형식Content-Type은 MIME 타입 기반으로 작성됩니다.형식은 다음과 같습니다.




 




[type]/[subtype]






 



예시




 





데이터 형식

Content-Type 값

JSON

application/json

HTML 문서

text/html

평문 텍스트

text/plain

파일 업로드(Form)

multipart/form-data

URL 인코딩된 폼 데이터

application/x-www-form-urlencoded






 



















 



🖋️ 요청/응답에서의 역할요청(Request)클라이언트가 서버에 데이터를 보낼 때, 데이터의 형식을 명시합니다.예: JSON 데이터 전송




 




POST /api/login HTTP/1.1
Content-Type: application/json

{
  "username": "kks",
  "password": "1234"
}






 



응답(Response)서버가 클라이언트에 데이터를 보낼 때도 Content-Type을 지정해, 브라우저가 올바르게 렌더링할 수 있게 합니다.예: HTML 페이지 응답




 




HTTP/1.1 200 OK
Content-Type: text/html






 







 



🚨 Content-Type을 잘못 지정하면?만약 전송한 데이터와 Content-Type이 일치하지 않으면 서버나 클라이언트가 데이터를 잘못 해석하거나, 오류 코드(예: 415 Unsupported Media Type)를 반환할 수 있습니다.




 



예: JSON 데이터인데 application/x-www-form-urlencoded로 설정 → 파싱 실패 가능성.












 



🤔 Content-Type vs AcceptContent-Type과 혼동하기 쉬운 헤더가 하나 있죠! 바로 Accept 헤더입니다.




 





헤더 이름

의미

Content-Type

클라이언트가 보내는 데이터의 형식

Accept

클라이언트가 받고자 하는 데이터의 형식






 



예: 클라이언트가 서버에 JSON을 전송하고, 서버로부터 JSON 응답을 받고 싶을 때




 




POST /api HTTP/1.1
Content-Type: application/json
Accept: application/json






 







 



📚 더 읽어보기🔗 [MDN] https://developer.mozilla.org/ko/docs/Web/HTTP/Reference/Headers/Content-Type




 








Content-Type - HTTP | MDN
Content-Type 개체 헤더는 리소스의 media type을 나타내기 위해 사용됩니다.
developer.mozilla.org











🔗 [rookieand 벨로그]https://velog.io/@rookieand/MIME-type%EC%9D%80-%EB%AD%90%EA%B3%A0-Content-type%EC%9D%80-%EB%AD%94%EB%8D%B0




 








MIME type은 뭐고, Content-type은 뭔데?
내가 아는 MIME 이라고는 인터넷에서 나도는 그 밈밖에 몰랐는데...
velog.io















 



📝 마무리프론트엔드 개발을 하면서 API 요청/응답을 디버깅하다 보면, Content-Type이 빠져 있거나 잘못 지정돼서 문제가 생기는 경우가 많습니다.내가 보내는 데이터의 형식이 무엇인지, 그리고 서버가 원하는 형식이 무엇인지 항상 확인하세요!오늘도 작은 배움이 쌓이는 하루 되시길 바랍니다. 🙌​




 
