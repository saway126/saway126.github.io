---
layout: post
title: "[매일매일] 프론트엔드 기술 일기:  왜 useState를 조건문 안에서 사용하면 안 되나요?(Vue 개발자 시점에서)" 
date: 2025-07-08 12:30:56 +0900
categories: [jekyll, update]
---






안녕하세요! 오늘은 리액트에서 자주 하는 실수 중 하나인useState를 조건문 안에서 호출하는 문제에 대해 정리해 보겠습니다.저는 평소에 Vue를 주로 사용해 왔는데, 리액트를 배우면서 이 부분이 낯설게 느껴졌습니다.Vue와 리액트는 상태를 관리하는 방식에 큰 차이가 있기 때문인데요.Vue를 많이 써본 분들이라면, 이 차이를 이해하면 더 쉽게 리액트에 적응할 수 있습니다.




 







 



🧩 리액트 Hook의 규칙리액트 공식 문서에서는 Hook을 사용할 때 두 가지 중요한 규칙을 강조합니다.✅ 항상 컴포넌트의 최상위 레벨에서 호출할 것✅ 항상 동일한 순서로 호출할 것이 규칙이 깨지면 리액트가 상태를 올바르게 관리하지 못하고,예기치 못한 버그가 발생할 수 있습니다.




 







 



🧩 Vue와 React의 상태 관리 방식 차이✅ VueVue는 data() 객체 안에서 reactive 상태를 선언합니다.이 상태는 컴포넌트 인스턴스에 속하고, 언제 렌더링을 하든 어디서 접근하든 항상 존재합니다.




 




<script setup>
import { ref } from 'vue'

const count = ref(0)

if (someCondition) {
  count.value = 1
}
</script>






 



상태를 조건문 안에서 "변경"하는 것은 괜찮습니다.상태를 만드는(ref) 건 컴포넌트가 생성될 때 항상 한 번만 실행됩니다.




 







 



✅ React리액트는 useState()를 호출하는 순서를 기반으로 상태를 추적합니다.




 




const [count, setCount] = useState(0)






 



이렇게 최상단에서 순서대로 useState()가 호출되어야, 리액트가 첫 번째 상태 = count로 인식합니다.




 







 



⚠️ 문제 상황다음과 같은 코드를 보겠습니다.




 




function Example({ shouldUseState }) {
  if (shouldUseState) {
    const [count, setCount] = useState(0);
  }

  return <div>Example Component</div>;
}






 



이 코드에서는 shouldUseState가 true일 때만 useState가 호출됩니다.그런데 렌더링 도중 shouldUseState가 false로 바뀌면, useState가 더 이상 호출되지 않게 되죠.




 







 



🧪 리액트 내부 동작리액트는 컴포넌트를 렌더링할 때, Hook을 호출한 순서대로 상태를 기록합니다.즉, 첫 번째 useState는 count, 두 번째 useState는 name… 이런 식으로 순서를 기억합니다.하지만 조건문에 의해 어떤 렌더링에서는 useState가 호출되고,다른 렌더링에서는 호출되지 않는다면,리액트가 상태를 매칭할 때 순서가 꼬이게 됩니다.그 결과, 엉뚱한 값이 들어가거나 렌더링 에러가 발생합니다.




 







 



🧭 올바른 코드 예시조건을 걸어야 한다면, 상태 자체는 항상 정의해 두고렌더링이나 로직에서 조건을 분기해야 합니다.




 




function Example({ shouldUseState }) {
  const [count, setCount] = useState(0);

  return (
    <div>
      Example Component
      {shouldUseState && <p>Count: {count}</p>}
    </div>
  );
}






 



이렇게 하면 useState는 항상 동일한 순서로 호출되고,렌더링만 조건에 따라 다르게 됩니다.




 







 



📝 정리Vue는 ref()로 만든 상태가 컴포넌트 인스턴스에 고정되어 있어 어디서 접근하든 안전하다.React는 useState()를 호출하는 순서에 의존하므로, 조건문/반복문 안에 두면 안 된다.상태 선언은 항상 컴포넌트 함수 최상단에서!




 







 



📚 추가 학습 자료React 공식 문서 - Hook 규칙d5br5.dev - React useState 동작 원리 이해하기




 







 



🚀 Vue에 익숙하다 보면 리액트의 Hook 규칙이 처음엔 낯설 수 있습니다.하지만 이 규칙만 기억해도 안정적이고 예측 가능한 코드를 작성할 수 있습니다!












 



​




 
