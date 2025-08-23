---
layout: post
title: "[매일매일]백엔드 기술 일기: 스프링 @Transactional AOP 동작 흐름 완전 정복" 
date: 2025-06-20 19:42:00 +0900
categories: [백엔드, Spring Boot, Java]
---






안녕하세요, [매일매일] 백엔드 기술일기입니다.오늘은 스프링의 핵심 기능 중 하나인 @Transactional의 동작 흐름을 AOP 기반으로 풀어보려 합니다. 이 개념은 단순히 어노테이션 하나 붙이는 걸 넘어서, 스프링 AOP와 트랜잭션 추상화의 깊은 이해가 필요한 주제입니다.




 







 



🧩 핵심 질문




 



@Transactional 어노테이션은 내부적으로 어떻게 작동하나요?












 



⚙️ 선언적 트랜잭션 관리란?스프링에서는 @Transactional 어노테이션을 통해 선언적으로 트랜잭션을 관리할 수 있습니다.이는 개발자가 직접 커넥션을 열고, 커밋/롤백하는 코드 없이도 트랜잭션을 안전하게 처리할 수 있도록 도와줍니다.




 







 



🛠️ 등장인물 정리1. 트랜잭션 AOP 프록시@Transactional이 붙은 메서드를 감싸는 프록시 객체.실제 서비스 객체를 호출하기 전에 트랜잭션 관련 로직을 먼저 처리함.​2. PlatformTransactionManager (트랜잭션 매니저)스프링이 제공하는 트랜잭션 추상화 인터페이스.대표 구현체:DataSourceTransactionManager (JDBC)JpaTransactionManager (JPA)​3. TransactionSynchronizationManager (트랜잭션 동기화 매니저)현재 스레드에 커넥션을 바인딩하고 관리하는 역할.여러 DAO/Service에서도 같은 트랜잭션 컨텍스트를 공유할 수 있게 해줌.




 







 



🔄 전체 동작 흐름 요약

![Spring Boot AOP Flow](/assets/img/posts/backend/spring-aop-flow.svg){: .normal w='400' h='300' }

*Spring Boot AOP 트랜잭션 동작 흐름 다이어그램*

클라이언트 요청 → AOP 프록시 → 트랜잭션 시작 → 실제 비즈니스 로직 실행 → 트랜잭션 종료 1. 클라이언트가 서비스 메서드를 호출하면프록시 객체가 가로채서 동작함 (@Transactional 덕분에 AOP 적용됨)​2. 프록시가 PlatformTransactionManager를 통해 트랜잭션 시작내부적으로 커넥션 획득TransactionSynchronizationManager에 바인딩​3. 비즈니스 로직 실행같은 스레드에서 트랜잭션에 참여 중인 DAO/서비스들도 같은 커넥션 사용​4. 정상 종료 시 → 커밋예외 발생 시 → 롤백​5. 트랜잭션 종료 후, 커넥션 반환 및 정리TransactionSynchronizationManager에서 언바인딩




 







 



🧪 코드 예시로 이해해보기




 




@Service
public class OrderService {
    
    @Transactional
    public void placeOrder() {
        saveOrder(); // 내부 DAO 호출
        updateInventory(); // 다른 서비스 호출
    }
}






 



위 코드에서 @Transactional이 붙은 placeOrder()는 실제로는 AOP 프록시 객체가 감싸게 됩니다.즉, 호출 시 트랜잭션 시작 → 내부 메서드 실행 → 커밋 or 롤백 → 종료의 흐름이 자동 적용됩니다.




 







 



💡 트랜잭션 동기화 매니저가 왜 중요할까?TransactionSynchronizationManager는 말 그대로 스레드-로컬(ThreadLocal) 기반의 트랜잭션 공유 관리자입니다.여러 DAO나 레이어에서 동일한 트랜잭션을 사용하게 해줍니다.없었다면?→ 모든 DAO 메서드에 커넥션을 직접 넘겨줘야 했을 것!




 




// 내부적으로는 이렇게 작동함
Connection conn = DataSource.getConnection();
TransactionSynchronizationManager.bindResource(dataSource, conn);






 







 



📚 추천 참고 자료🎥 [10분 테코톡] 리차드의 @Transactional: 선언형 트랜잭션 입문자용 영상🎥 [10분 테코톡] 기론, 리버의 JDK Proxy vs CGLIB📄 [Spring 공식 문서] AOP와 트랜잭션📘 테코블 블로그 - AOP 입문자를 위한 개념 이해하기📘 자바 트랜잭션 정복기 (전문 개발자 필독)




 







 



✅ 한 눈에 요약




 





구성 요소

역할

AOP 프록시

@Transactional 메서드 감싸기

트랜잭션 매니저

트랜잭션 시작/종료 책임 (JDBC/JPA에 따라 선택)

동기화 매니저

스레드 기반 커넥션 공유로 트랜잭션 일관성 유지






 







 



✍️ 마무리@Transactional은 개발자를 편하게 만들어주는 강력한 기능이지만, 내부 구조를 이해하고 있어야 예외 처리, 롤백 조건, 트랜잭션 전파 속성 등을 정확히 다룰 수 있습니다.앞으로도 실무에서 흔히 접하는 AOP + 트랜잭션 구조를 익혀두고, 필요한 순간에 정확히 적용해보세요.




 







 



🏷️ 태그#Spring #@Transactional #AOP #TransactionManager #스프링트랜잭션 #백엔드개발




 
