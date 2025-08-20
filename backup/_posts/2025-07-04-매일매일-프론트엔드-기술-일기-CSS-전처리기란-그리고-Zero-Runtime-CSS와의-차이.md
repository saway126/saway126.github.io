---
layout: post
title: "[매일매일] 프론트엔드 기술 일기: CSS 전처리기란? 그리고 Zero Runtime CSS와의 차이" 
date: 2025-07-04 16:35:23 +0900
categories: [jekyll, update]
---






안녕하세요! 오늘은 프론트엔드 개발자라면 꼭 한 번은 접하게 되는 개념인 CSS 전처리기와 최근 트렌드인 Zero Runtime CSS의 차이에 대해 알아보겠습니다.CSS를 더 효율적이고 체계적으로 작성하기 위한 도구들에 대해 정리해볼게요.




 



















 



🎨 CSS 전처리기란?CSS 전처리기(CSS Preprocessor)는 CSS를 더 프로그래밍스럽게 작성할 수 있게 도와주는 도구입니다.CSS는 기본적으로 선언적이고 단순한 문법을 제공하지만,✅ 변수 사용 불가✅ 코드 재사용 어려움✅ 조건문/반복문 불가등의 단점이 있습니다.CSS 전처리기는 이런 단점을 극복하기 위해 등장했습니다.CSS 전처리기를 사용하면 변수, 믹스인, 중첩, 함수 등을 사용할 수 있고, 작성한 코드를 일반 CSS로 컴파일하여 브라우저에서 사용합니다.​대표적인 전처리기Sass (SCSS): 가장 널리 사용되는 전처리기Less: 초기 도입이 빠른 전처리기Stylus: 문법이 유연한 전처리기




 







 



📄 예시 코드 비교💻 일반 CSS




 




.primary-button {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border-radius: 4px;
}

.secondary-button {
  background-color: #6c757d;
  color: white;
  padding: 10px 20px;
  border-radius: 4px;
}






 



💻 Sass (SCSS)




 




$button-padding: 10px 20px;
$border-radius: 4px;

@mixin button($bg-color) {
  background-color: $bg-color;
  color: white;
  padding: $button-padding;
  border-radius: $border-radius;
}

.primary-button {
  @include button(#007bff);
}

.secondary-button {
  @include button(#6c757d);
}






 



전처리기를 사용하면 반복되는 코드를 줄이고, 유지보수하기 좋은 구조로 작성할 수 있습니다.




 







 



⚖️ Zero Runtime CSS와의 차이CSS 전처리기와 Zero Runtime CSS는 모두 컴파일 타임에 CSS를 생성한다는 공통점이 있지만, 등장 배경과 목적이 다릅니다.




 






CSS 전처리기

Zero Runtime CSS

목적

CSS의 한계 극복

CSS-in-JS의 성능 문제 해결

등장 배경

변수, 함수, 중첩 등 프로그래밍적 기능 제공

런타임 연산 제거로 성능 최적화

문법

CSS와 유사한 확장 문법

JS 기반 문법

스타일링 패러다임

전통적인 전역 스타일

컴포넌트 중심 스타일링






 



Zero Runtime CSS는 CSS-in-JS의 런타임 비용 문제를 해결하기 위해, 스타일을 미리 컴파일해 더 빠르고 가벼운 코드를 만들어줍니다.




 







 



📚 추천 학습 자료더 깊이 공부하고 싶다면 아래 자료를 참고해보세요!https://oneoneone.kr/content/c9f3792f




 








CSS 전처리기: 종합적인 비교 | 일일일
### 🙋 추천 이유 - CSS 전처리기를 선택하는 데 어려움을 겪고 있는 개발자에게 추천합니다. - 프로젝트에 적합한 전처리기를 선택할 때 이 링크를 통해 각 전처리기의 장단점을 비교할 수 있습니다. ### ✅ 간단 요약 - Sass, SCSS, Less, Stylus의 주요 기능과 사용 사례를 설명합니다. - 각 전처리기의 문법 차이와 성능을 비교하여 적합한 선택을 돕습니다. - 프로젝트 요구 사항에 따라 최적의 전처리기를 선택하는 방법을 제시합니다.
oneoneone.kr











https://www.youtube.com/watch?v=Eim11QYLfEY




 















 



🌱 마무리CSS 전처리기는 더 깔끔하고 유지보수하기 좋은 CSS를 작성하기 위해 필수적으로 사용되던 도구입니다.최근에는 CSS-in-JS, Zero Runtime CSS와 같은 새로운 스타일링 방식이 트렌드가 되고 있지만, 여전히 많은 프로젝트에서 전처리기를 사용하고 있습니다.각 도구의 장단점을 이해하고, 프로젝트 상황에 맞게 선택하는 것이 중요합니다!




 







 



✍️ 오늘도 좋은 코드, 가벼운 CSS와 함께하는 하루 되세요!궁금한 점은 댓글로 남겨주세요. 😊








​




 
