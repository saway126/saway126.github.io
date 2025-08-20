---
layout: post
title: "[매일매일] 프론트엔드 기술 일기: 쌓임 맥락(Stacking Context) 개념 정리" 
date: 2025-06-24 16:29:40 +0900
categories: [jekyll, update]
---






프론트엔드를 하다 보면 z-index를 아무리 높여도 요소가 안 올라오는 경험, 다들 한 번쯤 해보셨을 거예요.그 이유는 바로 쌓임 맥락(Stacking Context) 때문입니다.




 



















 



🌀 쌓임 맥락이란?​HTML/CSS에서 요소들이 화면에 표시될 때, 2D가 아닌 가상의 3차원 공간(z축) 위에 배치됩니다.이때 요소들의 위계 관계를 쌓임 맥락이라는 개념으로 관리합니다.




 



📌 쉽게 말해:❝서로 다른 집에 사는 친구들은 서로의 방 구조를 모릅니다❞→ 쌓임 맥락이 다르면 서로의 z-index를 비교할 수 없습니다.












 



🧭 기본 쌓임 규칙HTML은 기본적으로 DOM 순서대로 요소를 쌓습니다.position 속성 + z-index를 활용하면 쌓임 순서를 조정할 수 있습니다.그러나 쌓임 맥락이 생성되면, 그 안의 요소들은 독립적으로 쌓입니다.




 







 



🏗️ 쌓임 맥락이 생성되는 조건




 





조건

설명

position: relative/absolute + z-index

z-index가 auto가 아닌 경우

position: fixed 또는 sticky

항상 새로운 쌓임 맥락 생성

opacity < 1

투명도가 적용되면 쌓임 맥락 생성

transform, filter, backdrop-filter

시각적 변형이 적용되면 생성

display: flex/grid + z-index

해당 조합에서도 생성 가능






 







 



🔍 예시 코드




 




<div style="position: relative; z-index: 1;">
    A 요소 (z-index: 1)
    <div style="position: absolute; z-index: 999;">
        A-1 요소 (z-index: 999)
    </div>
</div>

<div style="position: relative; z-index: 2;">
    B 요소 (z-index: 2)
</div>






 



🧠 쌓이는 순서:B 요소 (z-index: 2) ← 최상위 쌓임 맥락에서 가장 큼A-1 요소 (z-index: 999) ← A 요소 내부 쌓임 맥락의 최상단A 요소 (z-index: 1)❗️주의: A-1의 z-index가 아무리 커도, B 요소보다 위에 올라갈 수 없습니다.왜냐하면 A 요소가 만든 쌓임 맥락 안에 있기 때문입니다.




 







 



🧩 자주 하는 실수z-index: 9999를 줬는데도 안 올라온다?👉 쌓임 맥락이 달라서입니다!​overlay 모달이 버튼 뒤로 간다?👉 부모 요소에 transform, opacity, z-index 등이 있는지 확인하세요.




 







 



📚 추가 학습 자료https://www.youtube.com/watch?v=ln9vfw-JAr8




 











https://developer.mozilla.org/ko/docs/Web/CSS/CSS_positioned_layout/Stacking_context




 








쌓임 맥락 - CSS: Cascading Style Sheets | MDN
쌓임 맥락(stacking context)은 가상의 Z축을 사용한 HTML 요소의 3차원 개념화입니다. Z축은 사용자 기준이며, 사용자는 뷰포트 혹은 웹페이지를 바라보고 있을 것으로 가정합니다. 각각의 HTML 요소는 자신의 속성에 따른 우선순위를 사용해 3차원 공간을 차지합니다.
developer.mozilla.org















 



✍️ 마무리 정리




 



z-index는 비교할 수 있는 "범위"가 같을 때만 의미가 있다.쌓임 맥락이 다르면 z-index 비교는 무의미하다.








​




 
