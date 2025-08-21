---
layout: post
title: "✨ [매일매일] 프론트엔드 기술 일기: 웹 애니메이션 최적화의 핵심, requestAnimationFrame() 완전 정리" 
date: 2025-07-15 14:22:43 +0900
categories: [jekyll, update]
---






웹에서 애니메이션을 구현할 때 setTimeout()이나 setInterval()을 사용하곤 합니다. 하지만 이렇게 작성한 애니메이션이 끊기거나 프레임 드롭이 발생한 경험이 있다면, 그 해결책은 바로 requestAnimationFrame()입니다.오늘은 requestAnimationFrame()의 개념부터 장점, 예제까지 알아보고, 왜 프론트엔드 개발자라면 꼭 알아둬야 하는 API인지 정리해보겠습니다.




 



















 



🖼️ requestAnimationFrame()이란?requestAnimationFrame()은 브라우저의 화면 갱신 주기에 맞춰 콜백 함수를 실행하도록 요청하는 API입니다.즉, 브라우저가 화면을 다시 그리는 최적의 타이밍에 콜백이 호출되므로, 애니메이션이 보다 부드럽고 성능 친화적으로 실행됩니다.브라우저는 일반적으로 초당 60프레임(60fps) 또는 120fps, 144fps 등의 속도로 화면을 갱신합니다. 이 주기에 맞춰 동작하기 때문에, 프레임 드롭 현상을 최소화하고 부드러운 사용자 경험을 제공합니다.




 







 



💡 사용 예제예를 들어, 일정 시간 동안 반복되는 애니메이션을 구현한다고 가정해봅시다.




 




const animate = () => {
  // 애니메이션에 필요한 동작 수행
  console.log('애니메이션 프레임 실행!');

  if (/* 특정 조건 */) {
    return; // 조건이 충족되면 종료
  }

  requestAnimationFrame(animate);
};

requestAnimationFrame(animate);






 



setTimeout()이나 setInterval()과 달리, requestAnimationFrame()은 브라우저가 렌더링하기 전에 호출되기 때문에 렌더링 주기와 완벽하게 맞아떨어집니다.




 







 



🆚 setTimeout()/setInterval()과의 차이점




 





항목

setTimeout() / setInterval()

requestAnimationFrame()

실행 간격

고정 시간 간격

브라우저의 프레임 속도에 맞춤

부드러움

끊김 가능성

매끄러운 애니메이션

배터리/리소스

항상 실행

백그라운드에서 멈춤

주사율 대응

불가능

60Hz, 120Hz 등 자동 대응






 







 



🌟 추가적인 장점✅ 디스플레이 주사율에 최적화60Hz, 120Hz, 144Hz 등 모니터 주사율에 맞춰 프레임 속도가 자동 조정됩니다.✅ 백그라운드 탭에서는 실행 중단백그라운드 탭이나 숨겨진 상태에서 애니메이션을 멈춰 배터리 절약과 시스템 자원 최적화에 기여합니다.




 







 



🔍 콜백은 어디서 실행될까?requestAnimationFrame()의 콜백은 태스크 큐(Task Queue)나 마이크로태스크 큐(Microtask Queue)가 아닌,브라우저의 렌더링 엔진에 의해 관리됩니다.정확히는 HTML 표준에서는 이를 "map of animation frame callbacks"라 부르며, 별도의 큐에서 독립적으로 관리됩니다.즉, 브라우저 렌더링 사이클과 긴밀히 동작하기 때문에 프레임 드롭 없이 최적의 성능을 낼 수 있습니다.




 







 



📚 추천 자료 및 출처[Inpa Dev]https://inpa.tistory.com/entry/%F0%9F%8C%90-requestAnimationFrame-%EA%B0%80%EC%9D%B4%EB%93%9C




 








🌐 웹 애니메이션 최적화 requestAnimationFrame 가이드
자바스크립트 웹 애니메이션 웹페이지의 애니메이션을 구현할때 CSS의 animatoin , transition , transform 속성을 통해 구현할 수도 있지만, 보다 사용자와의 복잡한 상호작용을 구현하게 하기 위해 Javascript와 함께 사용하여 스타일을 변화시키도 한다. 예를들어 특정 영역을 클릭하거나 웹페이지를 스크롤할때 변화무쌍한 애니메이션 작업들이 그러하다. 그래서 간단하고 규칙적인 애니메이션은 CSS로만 요소의 좌표값이나 스타일 크기를 변화시키고, 세밀한 조작이 필요한 애니메이션은 자바스크립트로 스타일 속성을 변경 ...
inpa.tistory.com











[HTML Standard]https://html.spec.whatwg.org/multipage/imagebitmap-and-animations.html#list-of-animation-frame-callbacks




 





HTML Standard
IDL typedef ( Uint8ClampedArray or Float16Array ) ImageDataArray ; enum ImageDataPixelFormat { " rgba-unorm8 " , " rgba-float16 " }; dictionary ImageDataSettings { PredefinedColorSpace colorSpace ; ImageDataPixelFormat pixelFormat = " rgba-unorm8 "; }; [ Exposed =( Window , Worker ), Serializable ]...
html.spec.whatwg.org











[Stack Overflow]https://stackoverflow.com/questions/77008112/which-queue-is-associated-with-requestanimationframe




 







 



✍️ 마무리requestAnimationFrame()은 단순히 애니메이션을 만드는 방법 이상의 의미를 가집니다.사용자의 디바이스 환경에 최적화된 부드러운 경험을 제공하며, 자원 관리 측면에서도 탁월한 선택이죠.앞으로 웹 애니메이션을 구현할 때는 반드시 requestAnimationFrame()을 고려해보세요!




 







 



혹시 더 궁금한 부분이나 코드 예제를 확장해보고 싶다면 댓글로 남겨주세요.📧 개발은 성능과 사용자 경험을 함께 고려하는 것! 오늘도 성장하는 하루 되세요. 🌱​




 
