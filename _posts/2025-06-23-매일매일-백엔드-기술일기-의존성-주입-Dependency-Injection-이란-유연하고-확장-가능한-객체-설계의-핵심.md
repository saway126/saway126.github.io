---
layout: post
title: "☕ [매일매일]백엔드 기술일기:  의존성 주입(Dependency Injection)이란? – 유연하고 확장 가능한 객체 설계의 핵심" 
date: 2025-06-23 18:44:06 +0900
categories: [백엔드, Spring Boot, 디자인패턴]
---


















"객체를 생성할 때 직접 만들지 않고, 누가 대신 만들어 준다면?"바로 의존성 주입(Dependency Injection, DI)의 시작입니다.
https://www.elancer.co.kr/blog/detail/158












 



✅ 의존성(Dependency)이란?예를 들어, A 객체가 어떤 작업을 수행하기 위해 B 객체를 필요로 한다면, 우리는 "A는 B에 의존한다"고 표현합니다.이때 B를 직접 생성하거나 관리하게 되면, A와 B는 강하게 결합되며 유연성이 떨어지게 됩니다.




 







 



🔄 의존성 주입이란?의존성 주입(DI)은 외부 객체(C)가 필요한 의존 객체(B)를 생성하고, 이를 사용 객체(A)에게 주입해주는 방식입니다.




 
















기존 방식:
A 객체 → B 객체 직접 생성 및 사용 (강한 결합)

DI 방식:
C 객체 → B 객체 생성 → A 객체에게 전달 (느슨한 결합)






 



이처럼 생성 책임을 외부로 위임하면, A는 B의 구체적인 구현에 의존하지 않고도 동작하게 됩니다.




 







 



💡 의존성 주입의 장점




 





장점

설명

1️⃣ 낮은 결합도

객체 간 직접적인 의존 관계를 제거하여 유지보수 쉬움

2️⃣ 테스트 용이

테스트 시 모의 객체(mock)를 쉽게 주입 가능

3️⃣ 코드 재사용성 ↑

구현체만 바꾸면 다양한 상황 대응 가능

4️⃣ 변경에 강한 구조

구현 변경 시 호출부 수정 필요 없음






 







 



🧪 주입 방식 – 언제 무엇을 써야 할까?




 





주입 방식

설명

적절한 상황

생성자 주입

생성자 파라미터로 의존성 전달

불변 의존성, 초기화 시점 명확하게

Setter 주입

set 메서드로 전달

선택적 의존, 초기화 이후 설정 가능

메서드 주입

특정 메서드 내부에서 일시적으로 전달

매번 다른 인스턴스 필요할 때






 



🔸 생성자 주입이 가장 안정적이며, 필수 의존성에 적합합니다.🔸 Setter나 메서드 주입은 조건부/선택적 의존성에 활용됩니다.












 



📚 예시 코드 – Spring 기준 생성자 주입




 




@Component
public class OrderService {
    private final PaymentService paymentService;

    @Autowired // 생략 가능
    public OrderService(PaymentService paymentService) {
        this.paymentService = paymentService;
    }
}






 



이렇게 작성하면 PaymentService는 외부에서 자동으로 주입되며, OrderService는 구현체를 몰라도 동작합니다.​https://jeongkyun-it.tistory.com/172




 








[Spring] 의존성 주입(Dependency Injection)이란? (개념/ 예제/ 총 정리)
서론 이번글에서는 스프링을 이용한 의존성 주입에 대해서 알아보려한다. 의존성 주입(DI)은 크게 4가지 방법이 있다. 1. 생성자 주입 2. 수정자 주입(setter 주입) 3. 필드 주입 4. 일반 메서드 주입 위와 같이 4가지 방법이 있는데, 네가지 중 어떤 방식이 효율적이고 실제 실무에서 어떻게 쓰이는지 간략히 정리해보려한다. 의존성 주입(Dependency Injection)이란? Sprng Framework의 3가지 핵심 프로그래밍 중 하나인 의존성 주입(DI)는 외부에서 두 객체 간의 관계를 결정해주는 디자인 패턴으로 인...
jeongkyun-it.tistory.com















 



🧭 마무리 정리의존성 주입은 객체 간 결합도를 낮춰주는 설계 방식입니다.​테스트와 유지보수에 유리하며, Spring, NestJS, Angular 등 많은 프레임워크에서 기본 지원합니다.​어떤 주입 방식을 쓸지는 상황에 따라 달라지며, 팀 내 컨벤션에 맞추는 것이 중요합니다.




 







 



🔗 추천 참고자료https://www.youtube.com/watch?v=8lp_nHicYd4




 











https://www.youtube.com/watch?v=BO7QFUnVdjc




 











https://tecoble.techcourse.co.kr/post/2021-04-27-dependency-injection/




 








의존관계 주입(Dependency Injection) 쉽게 이해하기
이번 글에서는 DI(의존성 주입, 의존관계 주입)의 개념을 설명한다. DI란 용어가 주는 위압감과 부담감 때문에 이해를 미뤄뒀거나, 처음 접하는 분들이 쉽게 이해할 수 있도록 쉽게 설명하고자 한다. DI 란 무엇인가 DI는 Dependency…
tecoble.techcourse.co.kr











​​




 
