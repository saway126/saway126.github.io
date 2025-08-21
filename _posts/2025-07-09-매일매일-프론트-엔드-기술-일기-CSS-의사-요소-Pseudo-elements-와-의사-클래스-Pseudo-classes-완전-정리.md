---
layout: post
title: "[매일매일]프론트 엔드 기술 일기: CSS 의사 요소(Pseudo-elements)와 의사 클래스(Pseudo-classes) 완전 정리" 
date: 2025-07-09 13:15:07 +0900
categories: [jekyll, update]
---






프론트엔드 개발을 하다 보면 CSS 선택자만으로는 부족할 때가 있습니다.예를 들어, 특정 요소의 일부만 스타일링하거나, 특정 상태일 때만 스타일을 바꾸고 싶다면?이럴 때 유용하게 쓸 수 있는 것이 바로 의사 요소와 의사 클래스입니다.오늘은 두 개념의 차이와 활용법을 예시 코드와 함께 정리해보겠습니다.




 







 



🧩 의사 요소란?의사 요소(Pseudo-elements)는 HTML 요소의 특정 부분을 선택해 스타일을 적용하는 기능입니다.HTML을 수정하지 않고도 요소의 앞, 뒤, 첫 글자, 첫 줄 등에 스타일을 지정할 수 있어 편리합니다.대표적인 의사 요소




 





의사 요소

설명

::before

요소의 시작 부분에 콘텐츠 삽입

::after

요소의 끝 부분에 콘텐츠 삽입

::first-letter

요소의 첫 글자 선택

::first-line

요소의 첫 줄 선택






 



예제: 버튼 앞에 아이콘 추가하기




 




button::before {
  content: '🔥';
  margin-right: 5px;
}






 



위 코드를 적용하면 버튼의 텍스트 앞에 불꽃 이모지가 나타납니다.




 







 



🧩 의사 클래스란?의사 클래스(Pseudo-classes)는 HTML 요소의 특정 상태나 조건을 선택하는 기능입니다.예를 들어, 마우스가 올라갔을 때(:hover), 첫 번째 요소일 때(:first-child) 등에만 스타일을 다르게 지정할 수 있습니다.대표적인 의사 클래스




 





의사 클래스

설명

:hover

마우스를 올렸을 때

:active

클릭했을 때

:focus

포커스가 갔을 때

:first-child

부모 안에서 첫 번째 자식

:last-child

부모 안에서 마지막 자식






 



예제: 버튼에 마우스 오버 시 스타일 변경




 




button:hover {
  background-color: #ffcccc;
}






 







 



📊 의사 요소 vs 의사 클래스




 





구분

기준

예시

의사 요소

요소의 특정 부분 선택

::before, ::after

의사 클래스

요소의 특정 상태/조건 선택

:hover, :focus






 



쉽게 말해:의사 요소: 어디의 부분인지의사 클래스: 어떤 상태인지




 







 



✨ 요약✅ 의사 요소는 요소 내부의 특정 부분에 스타일 적용✅ 의사 클래스는 요소의 상태나 조건에 따라 스타일 적용✅ ::before / ::after를 활용해 불필요한 HTML을 만들지 않아도 된다.✅ 두 개념을 잘 조합하면 더 유연하고 깔끔한 CSS 코드를 작성할 수 있다.




 







 



📚 참고 자료https://www.tcpschool.com/css/css_selector_pseudoElement




 








코딩교육 티씨피스쿨
4차산업혁명, 코딩교육, 소프트웨어교육, 코딩기초, SW코딩, 기초코딩부터 자바 파이썬 등
www.tcpschool.com











https://www.tcpschool.com/css/css_selector_pseudoClass




 








코딩교육 티씨피스쿨
4차산업혁명, 코딩교육, 소프트웨어교육, 코딩기초, SW코딩, 기초코딩부터 자바 파이썬 등
www.tcpschool.com











​




 
