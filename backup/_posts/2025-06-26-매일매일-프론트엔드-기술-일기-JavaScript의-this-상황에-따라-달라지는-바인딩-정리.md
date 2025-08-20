---
layout: post
title: "[매일매일] 프론트엔드 기술 일기: JavaScript의 this, 상황에 따라 달라지는 바인딩 정리" 
date: 2025-06-26 14:57:44 +0900
categories: [jekyll, update]
---


















자바스크립트에서 this는 고정된 값이 아니라 함수 호출 방식에 따라 동적으로 결정됩니다.오늘은 this가 바인딩되는 6가지 대표적인 상황을 예제와 함께 정리해봤습니다.












 



1️⃣ 전역 호출 (Global Context)




 




function globalFunc() {
  console.log(this);
}
globalFunc();






 



브라우저 환경: windowNode.js 환경: global




 



전역에서 선언한 함수는 전역 객체에 바인딩됩니다.












 



2️⃣ 메서드 호출 (Object Method)




 




const obj = {
  name: "Alice",
  greet: function () {
    console.log(this.name);
  },
};
obj.greet(); // "Alice"






 



this는 호출된 객체(obj) 를 가리킵니다.주의: const greet = obj.greet; greet(); 이렇게 따로 빼서 호출하면 this는 달라질 수 있음.




 







 



3️⃣ 생성자 함수 & 클래스 (Constructor & Class)




 




function Person(name) {
  this.name = name;
}
const person = new Person("Alice");
console.log(person.name); // "Alice"






 



this는 새로 생성된 인스턴스를 참조합니다.클래스도 같은 동작을 합니다.




 




class User {
  constructor(name) {
    this.name = name;
  }
}
const user = new User("Bob");






 







 



4️⃣ 명시적 바인딩 (call, apply, bind)




 




function greet() {
  console.log(this.name);
}
const user = { name: "Alice" };

greet.call(user);  // "Alice"
greet.apply(user); // "Alice"
const boundGreet = greet.bind(user);
boundGreet();      // "Alice"






 



call()과 apply()는 즉시 호출bind()는 새로운 함수 반환




 







 



5️⃣ 화살표 함수 (Arrow Function)




 




const obj = {
  name: "Alice",
  greet: () => console.log(this.name),
};
obj.greet(); // undefined






 



화살표 함수는 자신의 this를 갖지 않고, 상위 스코프의 this를 그대로 사용합니다.일반적으로 전역 this 또는 외부 함수의 this를 가리킴




 




function Timer() {
  this.seconds = 0;
  setInterval(() => {
    this.seconds++;
    console.log(this.seconds);
  }, 1000);
}






 







 



6️⃣ DOM 이벤트 핸들러




 




function Timer() {
  this.seconds = 0;
  setInterval(() => {
    this.seconds++;
    console.log(this.seconds);
  }, 1000);
}






 



일반 함수: 이벤트를 발생시킨 DOM 요소화살표 함수: 상위 스코프의 this




 







 



📌 요약 비교표




 





호출 방식

this가 참조하는 대상

전역 함수 호출

window (브라우저) / global (Node.js)

객체 메서드 호출

해당 객체

생성자 함수 호출

새로 생성된 인스턴스

call/apply/bind

명시적으로 지정한 객체

화살표 함수

상위 스코프의 this

DOM 이벤트 핸들러

일반 함수: 이벤트 대상 / 화살표: 상위 this






 







 



📚 참고 자료https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/this




 








this - JavaScript | MDN
JavaScript에서 함수의 this 키워드는 다른 언어와 조금 다르게 동작합니다. 또한 엄격 모드와 비엄격 모드에서도 일부 차이가 있습니다.
developer.mozilla.org











​




 
