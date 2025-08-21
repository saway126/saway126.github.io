---
layout: post
title: "[매일매일] 백엔드 기술 일기: 자바에서 클래스 정보를 알아내는 방법 — Reflection API란?" 
date: 2025-07-04 16:27:06 +0900
categories: [jekyll, update]
---






안녕하세요! 오늘은 자바 백엔드 개발을 공부하면서 꼭 한 번쯤 접하게 되는 Reflection API에 대해 정리해보았습니다.프레임워크 내부 동작을 이해하거나, 동적으로 클래스에 접근할 때 유용하게 쓰이는 기술입니다.




 



















 



📌 자바에서 클래스 정보를 알아내는 방법자바에서는 프로그램 실행 중에 클래스에 대한 정보를 얻고, 동적으로 메서드 호출이나 필드 접근을 할 수 있습니다.이때 사용하는 것이 바로 Reflection API입니다.Reflection API는 java.lang.reflect 패키지에 포함되어 있고,대표적으로 아래와 같은 클래스를 제공합니다.Class: 클래스 자체를 표현Method: 클래스가 가진 메서드를 표현Field: 클래스가 가진 필드를 표현덕분에 코드를 작성할 때 구체적인 타입을 몰라도, 런타임에 클래스의 구조에 접근할 수 있습니다.주로 프레임워크나 라이브러리에서 많이 사용되는데, 대표적으로 Spring의 DI 컨테이너나 JPA가 내부적으로 Reflection을 활용합니다.




 







 



🧩 Reflection API의 장점Reflection의 가장 큰 강점은 동적 처리입니다.✅ 런타임에 클래스 타입을 몰라도, 메서드/필드에 접근 가능✅ 사용자 입력이나 외부 설정에 따라 동적으로 메서드 실행 가능✅ 프록시 객체 생성, DI, AOP 등에 유용예를 들어, 다음과 같이 메서드를 동적으로 호출할 수 있습니다.




 




Class<?> clazz = Class.forName("com.example.MyClass");
Method method = clazz.getMethod("sayHello");
method.invoke(clazz.getDeclaredConstructor().newInstance());






 







 



⚠️ Reflection API의 단점하지만, Reflection은 몇 가지 단점도 있습니다.❌ 코드가 복잡해지고, 가독성이 떨어질 수 있습니다.❌ 캡슐화가 약화됩니다. (private 필드도 강제로 접근 가능)❌ 성능 저하가 발생할 수 있습니다. (JIT 최적화가 어려워짐)특히, 성능 문제는 최신 JVM에서는 크게 문제되지 않는 경우도 있지만, 대량으로 호출할 경우에는 유의해야 합니다.




 







 



🌱 마무리Reflection API는 자바를 더욱 유연하게 만들 수 있는 강력한 도구입니다.하지만 남용하면 유지보수가 어려워지고 성능이 떨어질 수 있기 때문에, 꼭 필요한 상황에서만 신중하게 사용하는 것이 좋습니다.




 







 



📚 추천 학습 자료더 깊이 공부하고 싶다면 아래 자료를 추천드립니다!​이미지 출처:https://www.geeksforgeeks.org/java/reflection-in-java/




 








Reflection in Java - GeeksforGeeks
Your All-in-One Learning Portal: GeeksforGeeks is a comprehensive educational platform that empowers learners across domains-spanning computer science and programming, school education, upskilling, commerce, software tools, competitive exams, and more.
www.geeksforgeeks.org











🎥 [10분 테코톡] 파랑, 아키의 리플렉션https://www.youtube.com/watch?v=67YdHbPZJn4




 











📝 [테코블] Reflection API 간단히 알아보자https://tecoble.techcourse.co.kr/post/2020-07-16-reflection-api/




 








Reflection API 간단히 알아보자.
Spring Framework를 학습하다 보면 Java Reflection API를 자주 접하게 된다. 하지만 Reflection API…
tecoble.techcourse.co.kr











🎥 [백기선님 유튜브] 자바, 리플렉션https://www.youtube.com/watch?v=Q-8FC09OSYg




 











📄 Oracle Java Magazine — Reflection for the modern Java programmerhttps://blogs.oracle.com/javamagazine/post/java-reflection-introduction




 








Reflection for the modern Java programmer
Take advantage of the rich metadata the Java compiler provides to the JVM.
blogs.oracle.com











📄 Oracle Java Magazine — The performance implications of Java reflectionhttps://blogs.oracle.com/javamagazine/post/java-reflection-performance




 








The performance implications of Java reflection
Reflection slows down your Java code. Why is that?
blogs.oracle.com















 



✍️ 오늘도 성장하는 하루 되세요!궁금한 점이 있으면 댓글로 남겨주세요. 😊












 



혹시 이 내용을 Markdown 파일이나 이미지 카드형 요약으로도 만들어 드릴까요? 원하시면 말씀해주세요! 🌟




 
