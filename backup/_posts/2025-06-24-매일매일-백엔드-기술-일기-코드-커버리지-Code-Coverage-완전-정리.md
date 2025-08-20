---
layout: post
title: "✅ [매일매일]백엔드 기술 일기: 코드 커버리지(Code Coverage) 완전 정리" 
date: 2025-06-24 16:40:51 +0900
categories: [jekyll, update]
---






테스트 코드를 작성하는 목적은 “실제 코드가 잘 작동하는지 검증”하기 위함이죠.그렇다면, "얼마나 잘 테스트하고 있을까?"를 수치로 보여주는 지표가 있다면?그게 바로 오늘의 주제, 코드 커버리지(Code Coverage) 입니다!




 



















 



🧪 코드 커버리지란?




 



"테스트가 실제 코드를 얼마나 실행시켰는지 나타내는 비율"








단순히 테스트를 작성하는 것만으로 끝나지 않고,어떤 코드가 테스트되었고, 어떤 코드가 빠졌는지를 수치로 파악할 수 있습니다.




 







 



📊 커버리지 측정 기준 3가지




 





구분

설명

예시

구문 커버리지 (Statement Coverage)

코드 라인들이 테스트에서 실행되었는지

전체 10줄 중 8줄이 실행 → 80%

결정 커버리지 (Decision/Branch Coverage)

if, switch 등의 분기 조건이 모두 테스트되었는지

true, false 분기 모두 실행

조건 커버리지 (Condition Coverage)

조건식 내부의 각 서브 조건이 true/false를 모두 가졌는지

a > 0, b > 0 각각의 결과 테스트






 







 



🔍 예제 코드로 이해해보기




 




public void productionCode(int a, int b) {
    if (a > 0 && b > 0) {
        // ...
    }
}






 





테스트 케이스

의미

productionCode(1, 1)

둘 다 true → 결정, 조건 커버리지 일부 만족

productionCode(0, 1)

a 조건 false 확인

productionCode(1, 0)

b 조건 false 확인






 



✔️ 조건 커버리지를 만족하려면→ a > 0, b > 0 각각이 true/false 되는 케이스 필요​✔️ 결정 커버리지를 만족하려면→ 전체 조건식 결과가 true/false 모두 실행되어야 함




 







 



⚠️ 커버리지가 높으면 무조건 좋은 걸까?




 



🤔 NO!커버리지는 "얼마나 테스트를 거쳤는지"는 알려주지만"테스트가 제대로 작성되었는지"는 말해주지 않습니다.








❌ 커버리지는 90%인데도 버그가 생길 수 있음​❌ 의미 없는 테스트가 코드만 실행해도 커버리지만 올라감​❌ 현실적으로 모든 예외 상황을 커버하기 어려움​그래서 커버리지는 보조 지표로 참고하고,의미 있는 테스트 케이스 작성이 핵심입니다.




 







 



🛠️ 커버리지 측정 도구 예시Java: JaCoCo, IntelliJ Coverage, CoberturaJavaScript/TypeScript: Jest, Istanbul, nycPython: Coverage.py




 







 



📚 추가 학습 자료https://www.youtube.com/watch?v=jdlBu2vFv58




 











https://tecoble.techcourse.co.kr/post/2020-10-24-code-coverage/




 








코드 커버리지(Code Coverage)가 뭔가요?
팀 프로젝트 요구 사항 우아한테크코스에서는 레벨 3,4 과정에서 팀 프로젝트를 진행하였다. 레벨 3에서 서비스를 구현했다면, 레벨…
tecoble.techcourse.co.kr











https://yozm.wishket.com/magazine/detail/2471/




 








개발자여, 테스트 커버리지에 집착 말자 | 요즘IT
글을 시작하기 앞서, ‘테스트’라는 낱말이 매우 보편적으로 쓰이기 때문에 이 글에서 말하는 테스트가 무엇인지 정의할 필요가 있다. 이 글에서 ‘테스트’는 개발자가 코드로 작성하고 코드를 실행하여 자동으로 테스트를 수행하는 것을 뜻한다. 요즘은 테스트 코드를 작성하는 것 자체가 논쟁 대상이 되지 않을 정도로 많은 개발자들(조직)이 테스트에 관심을 가지고 테스트를 작성한다. 개발자가 만든 테스트 코드를 측정하는 방법으로 보통 테스트(코드) 커버리지를 사용한다. 커버리지 지표는 테스트 코드가 코드 베이스를 얼마나 실행하는지 백분율로 나타...
yozm.wishket.com











​




 
