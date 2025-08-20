---
layout: post
title: "[매일매일] 테스트 더블(Test Double) 완전 정복" 
date: 2025-07-03 08:32:43 +0900
categories: [jekyll, update]
---


















단위 테스트에서 외부 의존성을 어떻게 다룰 것인가?




 







 



✨ 들어가며백엔드 개발을 하다 보면 DB, 외부 API, 메시지 큐, 파일 시스템 같은 의존성이 많습니다. 이런 의존성들과 함께 테스트를 작성하면 테스트가 느려지거나 불안정해질 수 있는데요, 이를 해결하기 위해 등장한 것이 바로 테스트 더블(Test Double) 입니다.




 







 



🧩 테스트 더블이란?




 



테스트 더블은 테스트 대상 객체가 의존하는 컴포넌트를 대신하는 "가짜 객체" 입니다.








실제 의존성을 그대로 사용하는 테스트는 다음과 같은 문제를 유발할 수 있습니다.외부 API 서버가 다운되면 테스트 실패DB 초기화가 번거롭고 느림복잡한 설정을 테스트마다 반복→ 테스트 더블을 사용하면 성능 개선, 결정성 보장, 단순화된 설정이 가능해집니다.




 







 



🔍 테스트 더블의 5가지 종류




 





종류

설명

주 사용 목적

더미 (Dummy)

아무 동작도 하지 않는 객체

매개변수 채우기용

스텁 (Stub)

미리 정의된 값을 반환

조건 충족, 흐름 제어

페이크 (Fake)

실제처럼 동작하지만 간단한 구현

인메모리 DB 등

스파이 (Spy)

어떤 메서드가 호출됐는지 기록

호출 횟수 검증

목 (Mock)

행위 기반 검증, 기대한 대로 안 되면 실패

TDD의 검증 중심 테스트






 







 



1. 🪵 Dummy (더미)




 




@Test
void createUser() {
    Logger dummyLogger = new DummyLogger(); // 아무 일도 하지 않음
    UserService service = new UserService(dummyLogger);
    service.create("Alice");
}






 



단순히 null이 아닌 객체가 필요할 때 사용호출되더라도 아무 동작도 하지 않음




 







 



2. 📦 Stub (스텁)




 




class StubEmailService implements EmailService {
    public boolean sendEmail(String to) {
        return true; // 항상 성공한 척
    }
}






 



특정 조건에 따라 고정된 값을 리턴테스트 흐름 제어에 유용




 







 



3. 🛠 Fake (페이크)




 




class InMemoryUserRepository implements UserRepository {
    private Map<String, User> db = new HashMap<>();
    public void save(User user) { db.put(user.getId(), user); }
    public User find(String id) { return db.get(id); }
}






 



실제처럼 작동하지만 간단한 구현예: 인메모리 DB, 임시 파일 시스템테스트 속도와 독립성 ↑




 







 



4. 👀 Spy (스파이)




 




class SpyEmailService implements EmailService {
    private boolean wasCalled = false;
    public boolean sendEmail(String to) {
        wasCalled = true;
        return true;
    }
    public boolean wasEmailSent() {
        return wasCalled;
    }
}






 



호출 여부, 호출 횟수 등 "기록"결과뿐 아니라 과정도 검증 가능




 







 



5. 🎭 Mock (목)




 




EmailService mock = mock(EmailService.class);
UserService service = new UserService(mock);

service.register("test@example.com");

// 기대한 대로 sendEmail이 호출되었는지 검증
verify(mock).sendEmail("test@example.com");






 



"기대하는 상호작용"이 있었는지 확인기대에 어긋나면 테스트 실패




 







 



🧭 Classic TDD vs Mockist TDD




 





구분

Classic TDD

Mockist TDD

중점

상태 검증

행위 검증

의존성 처리

실제 구현 or Fake 사용

Mock 객체 사용

장점

테스트 유지 보수성 ↑

개발 속도와 경량화 ↑

예시

"저장되었는가?"

"호출되었는가?"






 



예: 사용자가 저장되었는지 DB.getUser()로 확인 → Classic예: repository.save()가 호출되었는지 verify() → Mockist












 



📝 마무리테스트 더블은 단순히 "가짜 객체"가 아니라, 테스트의 목적을 명확하게 해주는 도구입니다.✔ 복잡한 의존성을 제거하고✔ 테스트 성능과 안정성을 확보하며✔ 객체 간 상호작용까지 검증할 수 있게 도와줍니다프로젝트 성격, 테스트 목적, 팀 스타일에 따라 다양한 조합으로 활용해보세요!




 







 



📚 참고 자료 및 출https://www.youtube.com/watch?v=n01foM9tsRo




 











https://www.youtube.com/watch?v=4q9d8Aye0nY&t=2169s




 











https://jojoldu.tistory.com/614




 








테스트 코드에서 내부 구현 검증 피하기
테스트 코드를 작성하고 운영하다보면 기존 코드가 조금만 변경되어도 테스트를 다 고쳐야하는 경우가 종종 있다. (모든 경우가 그렇진 않겠지만) 기능의 최종 결과를 검증하는게 아니라 내부 구현을 검증하는 경우에 자주 이런일이 있었다. 내부 구현을 검증하는 테스트들은 구현을 조금만 변경해도 테스트가 깨질 가능성이 커진다. 내부 구현은 언제든지 바뀔 수 있기 때문에 테스트 코드는 내부 구현 보다 최종 결과를 검증해야한다. 그럼, 내부 구현을 검증하는 경우란 어떤 것인지 알아보자. 1. 상세 구현부를 다 검증하는 경우 이를 테면 다음과 같이...
jojoldu.tistory.com











https://ysiksik.github.io/elegant-tekotok/2023-02-04-DUZ-TIKI-ClassicTDDVSMockistTDD/




 








더즈, 티키의 Classic TDD VS Mockist TDD
https://youtu.be/n01foM9tsRo
ysiksik.github.io











​




 
