---
layout: post
title: "[매일매일] 백엔드 기술 일기: 모니터링을 위한 핵심 라이브러리, Micrometer 완벽 정리" 
date: 2025-07-15 14:34:37 +0900
categories: [jekyll, update]
---






애플리케이션의 상태를 실시간으로 모니터링하고 싶다면, 그리고 Prometheus나 Datadog, Graphite 등 여러 모니터링 시스템과 연동하고 싶다면?그 답은 바로 Micrometer입니다.오늘은 백엔드 개발에서 점점 더 중요한 위치를 차지하는 Micrometer의 개념, Spring Boot Actuator와의 관계, 그리고 커스텀 메트릭 구현 예제까지 차근차근 살펴보겠습니다.




 



















 



🔍 Micrometer란?Micrometer는 벤더 중립적인 메트릭 계측 라이브러리입니다.즉, 애플리케이션에서 발생하는 다양한 지표(CPU, 메모리, HTTP 요청 수, 처리 시간 등)를 수집하고, 이를 Prometheus, Datadog, Graphite 같은 모니터링 시스템에 전송할 수 있도록 돕습니다.




 



📌 핵심은 단순하고 일관된 API(파사드)를 제공해 각 백엔드 클라이언트(Prometheus 클라이언트, Datadog 클라이언트 등)의 복잡한 세부 구현을 감춰준다는 점입니다.








Micrometer는 특히 Spring Boot Actuator와 깊게 통합돼 있어, JVM, HTTP, DB 등 기본 메트릭을 자동으로 수집하고 노출해줍니다.




 







 



⚙️ Spring Boot Actuator와 MicrometerSpring Boot Actuator는 애플리케이션의 상태, 헬스 체크, 환경, 로그 등 여러 운영 정보를 노출하는 관리 엔드포인트를 제공합니다.하지만 그 내부에서 실제 메트릭을 수집하는 건 Micrometer의 역할입니다.




 





역할

기능

Actuator

관리 엔드포인트 제공 (/actuator/metrics)

Micrometer

메트릭 데이터 수집 및 백엔드 전송






 



즉, Actuator가 운영자에게 편리한 인터페이스를 제공하고, Micrometer가 그 밑단에서 데이터를 계측하고 있는 구조입니다.




 







 



🧪 Micrometer로 커스텀 메트릭 만들기Micrometer를 사용하면 기본 메트릭 외에도, 비즈니스 로직에 맞춘 커스텀 메트릭을 정의할 수 있습니다.다음은 요청 수, 처리 시간, 활성 세션 수를 측정하는 예제입니다.✅ 전체 코드 예제




 




package com.example.metrics;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.Gauge;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Timer;
import org.springframework.stereotype.Service;

@Service
public class CustomMetricsService {

    private final Counter requestCounter;
    private final Timer requestTimer;
    private final CustomGauge customGauge;

    // 생성자에서 MeterRegistry를 주입받아 필요한 메트릭을 등록합니다.
    public CustomMetricsService(MeterRegistry meterRegistry) {
        // HTTP 요청 총 건수를 세는 Counter (태그로 엔드포인트 구분)
        this.requestCounter = meterRegistry.counter("custom.requests.total", "endpoint", "/api/test");

        // HTTP 요청 처리 시간을 측정하는 Timer (태그로 엔드포인트 구분)
        this.requestTimer = meterRegistry.timer("custom.request.duration", "endpoint", "/api/test");

        // Gauge: 예를 들어, 현재 활성 세션 수를 측정하기 위한 커스텀 객체를 등록
        this.customGauge = new CustomGauge();
        Gauge.builder("custom.active.sessions", customGauge, CustomGauge::getActiveSessions)
                .tag("region", "us-east")
                .register(meterRegistry);
    }

    /**
     * 실제 비즈니스 로직을 실행할 때 요청 카운트와 처리 시간을 측정합니다.
     * @param requestLogic 실제 처리할 로직 (예: HTTP 요청 처리)
     */
    public void processRequest(Runnable requestLogic) {
        // 요청 수 증가
        requestCounter.increment();
        // 요청 처리 시간 측정
        requestTimer.record(requestLogic);
    }

    /**
     * 활성 세션 수 업데이트 (예를 들어, 로그인/로그아웃 이벤트에서 호출)
     * @param activeSessions 현재 활성 세션 수
     */
    public void updateActiveSessions(int activeSessions) {
        customGauge.setActiveSessions(activeSessions);
    }

    /**
     * 커스텀 Gauge의 값을 저장하는 내부 클래스.
     */
    private static class CustomGauge {
        // 현재 활성 세션 수를 저장 (volatile을 사용해 스레드 안정성 확보)
        private volatile double activeSessions = 0;

        public double getActiveSessions() {
            return activeSessions;
        }

        public void setActiveSessions(double activeSessions) {
            this.activeSessions = activeSessions;
        }
    }
}





 







 



🗝️ 주요 구성 요소🏷️ MeterRegistry애플리케이션의 모든 메트릭을 중앙에서 관리합니다.설정된 모니터링 백엔드로 데이터를 주기적으로 전송합니다.🔢 Counter누적 수치(총 요청 수 등)를 측정합니다.예: requestCounter.increment();⏱️ Timer코드 실행 시간(지연 시간)을 측정합니다.예: requestTimer.record(requestLogic);📈 Gauge현재 상태를 실시간으로 반영합니다. (값이 변할 수 있음)예: 현재 활성 세션 수, 현재 대기열 크기 등




 







 



🧰 Micrometer를 왜 써야 하나요?✅ 다양한 모니터링 시스템과 연동 가능✅ 단순하고 일관된 API✅ Spring Boot Actuator와의 강력한 통합✅ JVM, OS, DB, HTTP 등 다양한 메트릭 지원✅ 커스텀 메트릭을 통한 비즈니스 데이터 모니터링 가능




 







 



📚 추천 자료 및 출[공식 문서] https://micrometer.io/




 








Micrometer Application Observability
Application observability facade for the most popular observability tools. Think SLF4J, but for observability.
micrometer.io











[Spring Boot Docs] https://docs.spring.io/spring-boot/reference/actuator/index.html




 





Production-ready Features :: Spring Boot
Edit this Page GitHub Project Stack Overflow Spring Boot / Reference / Production-ready Features Production-ready Features Spring Boot includes a number of additional features to help you monitor and manage your application when you push it to production. You can choose to manage and monitor your ap...
docs.spring.io











[Inpa Dev] Spring Boot 모니터링: Micrometer & Prometheushttps://blog.naver.com/71_stars/223684862156




 








202041206_한화 BEYOND SW캠프 Prometheus/grafana CPU 및 여러 API 모니터링
1. 프로메테우스 1) 설치 apt update apt -y install prometheus prometheus-node-exporter 2) 실행 system...
blog.naver.com











https://sjh9708.tistory.com/275




 








[Spring Boot] 시스템 모니터링 : Micrometer + Prometheus + Grafana
서비스가 안정적으로 운영되기 위해서는 애플리케이션의 상태를 수치로 관찰하고, 이상 징후를 빠르게 감지할 수 있어야 한다.특히 MSA나 클라우드 환경처럼 복잡성이 높아질수록 시스템의 가시성(Observability), 즉 관찰 가능한 지표(Metric), 로그(Log), 트레이싱(Trace)를 수집하고 시각화하는 과정이 필요하다. Spring Boot 기반 애플리케이션에서는 주로 Actuator와 Micrometer를 활용해 메트릭을 수집하고, Prometheus를 통해 데이터를 저장, Grafana로 대시보드를 구성하고 시각화하여 ...
sjh9708.tistory.com















 



🚀 마무리서버가 느려진다면? 사용자의 요청이 어디서 지체되는지 알고 싶다면?Micrometer를 활용해 애플리케이션의 심장 박동을 모니터링하세요.서비스를 운영하는 개발자라면 반드시 익혀야 할 강력한 도구입니다.궁금한 점이나 추가 예제가 필요하시다면 댓글로 남겨주세요!오늘도 더 좋은 코드를 위해, Happy Coding! 🧡




 
