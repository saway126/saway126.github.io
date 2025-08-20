---
layout: post
title: "[매일매일]백엔드 기술일기:  String 객체가 불변인 이유/리터럴로 생성한 String 객체와 생성자로 생성한 String 객체의 차이" 
date: 2025-07-18 18:12:45 +0900
categories: [jekyll, update]
---






String 객체는 불변(Immutable) 입니다. String 클래스는 내부적으로 final 키워드가 선언된 byte[] 필드를 사용해서 문자열을 저장하기 때문입니다. 또한, String은 참조 타입(Reference Type)이기 때문에 concat(), replace(), toUpperCase()와 같은 String 메서드를 호출하면 새로운 String 객체를 참조하고 기존 객체를 수정하지 않습니다. 따라서 String 객체를 불변하게 유지할 수 있습니다.




 







 



​String을 불변으로 설계한 이유는 무엇일까요?​String을 불변으로 설계한 덕분에 많은 이점을 얻을 수 있습니다.String Constant Pool을 사용할 수 있습니다. 이를 통해 동일한 문자열의 String 변수들은 같은 객체를 공유하기 때문에 메모리를 효율적으로 사용할 수 있습니다.불변한 객체는 멀티 스레드 환경에서 thread-safe합니다. 문자열을 변경하면 String Constant Pool에 새로운 객체를 생성하기 때문에 동기화를 신경쓸 필요가 없습니다.해시코드를 한 번만 계산하고 이를 캐싱해서 재사용할 수 있습니다.비밀번호, 토큰, URL 등의 민감한 정보를 안전하게 다룰 수 있습니다. 불변한 객체는 변경할 수 없기 때문에 민감한 정보가 예기치 않게 수정되는 것을 방지할 수 있습니다.




 







 



두 방식으로 생성한 객체는 같은 문자열을 갖더라도 메모리 상에서 다르게 처리됩니다.




 




String first = "hello"; // 리터럴로 생성
String second = new String("hello"); // 생성자로 생성
String third = "hello";

System.out.println(System.identityHashCode(first)); // 498931366
System.out.println(System.identityHashCode(second)); // 2060468723
System.out.println(System.identityHashCode(third)); // 498931366





 



리터럴로 생성한 String 객체는 Heap 영역의 String Constant Pool에 저장되어 동일한 문자열을 재사용할 수 있습니다. 문자열이 String Constant Pool에 이미 존재하면 같은 주소를 참조합니다. 반면, 생성자로 생성한 String 객체는 Heap 영역에 저장되어 동일한 문자열이더라도 항상 새로운 객체를 생성합니다.




 




String first = "hello";
String second = new String("hello");
String third = second.intern(); // intern() 메서드 사용

System.out.println(System.identityHashCode(first)); // 498931366
System.out.println(System.identityHashCode(second)); // 2060468723
System.out.println(System.identityHashCode(third)); // 498931366





 



intern() 메서드를 사용하면 Heap 영역에 저장된 String 객체를 String Constant Pool에 저장할 수 있습니다. intern() 메서드는 해당 문자열이 String Constant Pool에 존재할 경우 그 주솟값을 반환하고, 없을 경우 String Constant Pool에 추가하고 새로운 주솟값을 반환합니다.




 
