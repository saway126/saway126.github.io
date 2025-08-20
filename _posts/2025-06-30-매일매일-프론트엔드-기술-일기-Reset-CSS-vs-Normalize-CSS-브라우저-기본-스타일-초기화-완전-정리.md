---
layout: post
title: "[매일매일] 프론트엔드 기술 일기: Reset CSS vs Normalize CSS – 브라우저 기본 스타일 초기화 완전 정리" 
date: 2025-06-30 13:40:45 +0900
categories: [jekyll, update]
---






​웹 프론트엔드를 개발하다 보면, 브라우저마다 기본적으로 다르게 설정된 스타일 때문에 예상치 못한 디자인 문제를 겪는 경우가 많습니다. 이런 문제를 해결하기 위해 등장한 것이 바로 Reset CSS와 Normalize CSS입니다.이번 글에서는 두 방식의 차이점과 어떤 상황에 어떤 방법을 사용하는 것이 좋은지 정리해보겠습니다.




 



















 



🔧 Reset CSS란?Reset CSS는 말 그대로 브라우저의 기본 스타일을 모두 초기화(reset) 하는 CSS입니다.브라우저는 각자 기본 스타일을 가지고 있기 때문에, h1, ul, body, a 등 다양한 요소에 자동으로 마진, 패딩, 폰트 등의 값이 적용되어 있습니다. Reset CSS는 이런 스타일들을 완전히 제거하고 모든 요소를 백지 상태로 되돌려 개발자가 처음부터 스타일을 설계할 수 있게 도와줍니다.​📌 예시 코드




 




/* Reset CSS 예시 */
* {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}






 



✅ 장점완전한 스타일 통일 가능디자인 시스템 적용 시 유리❌ 단점모든 스타일을 직접 작성해야 함초기 작업량 증가




 







 



🌱 Normalize CSS란?Normalize CSS는 브라우저 스타일의 차이만을 일관되게 보정(normalize) 해주는 CSS입니다.초기 스타일을 모두 제거하는 대신, 브라우저마다 다르게 적용된 부분만 통일시켜줍니다.예를 들어, 브라우저마다 h1 태그의 마진이 다를 수 있는데, Normalize CSS는 이런 차이만 교정하고, 기본 스타일은 최대한 유지합니다.​📌 예시 코드




 




/* Normalize CSS 예시 */
h1 {
  font-size: 2em;
  margin: 0.67em 0;
}
a {
  background-color: transparent;
}






 



✅ 장점기본 스타일 유지로 자연스러운 디자인 가능빠른 개발 시작 가능❌ 단점완전한 초기화가 아니므로 일부 브라우저 차이는 남을 수 있음




 







 



🤔 어떤 걸 써야 할까?




 





기준

Reset CSS

Normalize CSS

스타일 통일성

최고

보통

초기 개발 속도

느림

빠름

디자인 시스템

적합

다소 불편

마크업 구조 보존

낮음

높음






 



빠르게 결과물이 필요한 프로젝트 👉 Normalize CSS디자인 시스템 기반의 철저한 설계 👉 Reset CSS




 







 



📚 참고 자료 및 출처🔗 [DaleSeo 블로그] CSS Normalize vs Reset CSS 설명→ https://www.daleseo.com/html-css-reset-normalize/🎬 [디자인 베이스 YouTube] Reset & Normalize CSS 차이 설명→ https://www.youtube.com/watch?v=dXgZK1dGspQ​https://velog.io/@nalsae/%EB%82%B4%EB%B3%B4%EC%A0%95CSS-reset-%EC%A4%84%EA%B9%8C-normalize-%EC%A4%84%EA%B9%8C




 








reset이냐 normalize냐, 그것이 문제로다!
🤔 reset과 normalize, 둘 중에 뭘 써야 하지?
velog.io















 



✍ 마무리하며Reset CSS와 Normalize CSS는 _브라우저 간 스타일 불일치 문제를 해결하기 위한 두 가지 방법_입니다. 프로젝트 성격, 디자인 방향, 팀의 스타일링 전략에 따라 적절히 선택해 사용해보세요.​​




 
