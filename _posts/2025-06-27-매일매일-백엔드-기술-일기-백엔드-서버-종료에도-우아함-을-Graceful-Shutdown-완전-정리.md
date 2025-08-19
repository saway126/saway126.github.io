---
layout: post
title: "️ [매일매일] 백엔드 기술 일기: 백엔드 서버 종료에도 ‘우아함’을! – Graceful Shutdown 완전 정리" 
date: 2025-06-27 13:07:20 +0900
categories: [jekyll, update]
---






서버가 종료될 때, 무조건 바로 꺼진다면 문제가 생길까요?정답은 "그렇다"입니다.바로 종료되는 서버는 진행 중인 작업이 강제 중단되며, 데이터 유실, 트랜잭션 꼬임, 사용자 경험 악화 등의 심각한 문제를 초래할 수 있어요.그래서 오늘은 서버 개발자라면 꼭 알아야 할 개념,Graceful Shutdown (우아한 종료)에 대해 정리해보겠습니다!




 



















 



✅ Graceful Shutdown이란?




 



“진행 중인 작업은 끝까지 처리하고 나서 안전하게 종료하는 방식”








Graceful Shutdown은 서버가 종료될 때,새로운 요청은 더 이상 받지 않고,현재 처리 중인 요청만 모두 마무리한 뒤,각종 리소스(DB 커넥션, 파일, 메모리 등)를 정리하고 종료하는 방식입니다.​❌ 반면, Graceful하지 않은 종료는?현재 처리 중인 트랜잭션이 끊기거나 롤백되지 않음사용자 응답 중단 (API 호출 실패 등)파일 저장 미완, 로그 유실 등




 







 



🧨 SIGTERM vs SIGKILL서버 종료 시 운영체제에서 보내는 신호(signal) 도 함께 알아봐야 합니다.




 





시그널

의미

특징

SIGTERM

종료 요청

프로세스가 직접 처리 가능, 종료 전에 정리 작업 가능

SIGKILL

강제 종료

즉시 죽임, 정리 작업 수행 불가






 



Graceful Shutdown은 주로 SIGTERM을 감지해 동작합니다.












 



🌱 스프링(Spring) 환경에서의 Graceful ShutdownSpring Boot 2.3 이상부터는 기본적으로 우아한 종료 설정이 지원됩니다!​📌 설정 방법 (application.yml)




 




server:
  shutdown: graceful

spring:
  lifecycle:
    timeout-per-shutdown-phase: 20s  # 최대 대기 시간






 



💡 동작 흐름서버가 SIGTERM을 받음새 요청 수신 중단기존 요청 완료까지 대기리소스 정리 (Thread, DB 등)종료




 



timeout-per-shutdown-phase는 요청이 너무 오래 걸리는 경우 자동으로 강제 종료되도록 합니다. (ex. 무한루프 등 방지)












 



⚠️ 주의할 점데드락, 무한 루프 같은 비정상 처리 로직이 있다면 timeout 내에도 종료되지 않을 수 있음ThreadPool이나 async 작업이 남아 있다면 정상 종료 안 될 수 있음외부 시스템(DB, Kafka 등)과 연결된 리소스도 명시적으로 close 해주는 습관이 필요함




 







 



📚 추천 자료https://effectivesquid.tistory.com/entry/JVM%EC%9D%98-%EC%A2%85%EB%A3%8C%EC%99%80-Graceful-Shutdown




 








JVM의 종료와 Graceful Shutdown
개발자는 어플리케이션을 개발 할 때 많은 것들을 고려한다. 코드를 작성하고 나서는 비즈니스 로직이 정확한 결과를 산출해내는지 검증하기 위해 테스트 코드를 작성하기도 하며, 성능 테스트를 통해 시스템에 병목 지점은 없는지 등을 확인한다. 어플리케이션이 정상적으로 시작되고 실행이 지속되는지는 매우 중요하다. 하지만 어플리케이션이 정상적으로 종료되는지도 굉장히 중요하다. 이번 글을 통해서 JVM 플랫폼 위에서 실행되는 어플리케이션이 정상적으로 종료되기 위한 여러 내용들을 소개하려고한다. 프로세스 종료 먼저, 프로세스를 종료시키기 위해 프...
effectivesquid.tistory.com











https://velog.io/@byeongju/SpringBoot%EC%9D%98-Graceful-Shutdown




 








SpringBoot Graceful-Shutdown 개념과 동작 원리
SpringBoot의 Graceful-Shutdown의 개념과 동작원리에 대해 알아보자
velog.io











https://velog.io/@480/SIGKILL-vs-SIGTERM-%EB%A6%AC%EB%88%85%EC%8A%A4-%EC%A2%85%EB%A3%8C-%EC%8B%A0%ED%98%B8




 








SIGKILL vs SIGTERM 리눅스 종료 신호
우리가 만든 서버 프로그램은 리눅스 서버의 한 프로세스로 동작 합니다.고로, 프로세스로 구동하는 모든 프로그램들, 예) 도커, nginx, node.js, Mysql 등의 종료에 관한 메커니즘을 이해 한다면, 장애 대비 개발을 할 수 있겠죠?그런데 요즘 아임웹은 배포에
velog.io











https://velog.io/@dongvelop/Springboot-Graceful-Shutdown




 








[Spring Boot] Graceful Shutdown(feat. 우아한 종료)
이제는 우아하게 종료시켜봐요
velog.io















 



📌 요약 정리




 





항목

설명

목적

서버 종료 시 요청 누락, 데이터 손실 방지

동작 방식

새 요청 거부 → 기존 요청 처리 → 리소스 해제 → 종료

주요 설정

server.shutdown=graceful, timeout-per-shutdown-phase=20s

사용하는 시그널

SIGTERM (우아한 종료), SIGKILL (즉시 종료)

주의사항

데드락, 무한 루프, 비동기 처리 등 종료 방해 요소 고려






 







 



💡 서버는 "죽을 때"도 품격 있게!Graceful Shutdown은 단순한 기능이 아니라,서비스 신뢰도와 데이터 무결성을 지키기 위한 필수 설계입니다.




 







 



🔖 태그: #백엔드 #Spring #GracefulShutdown #SIGTERM #서버종료 #매일매일​




 
