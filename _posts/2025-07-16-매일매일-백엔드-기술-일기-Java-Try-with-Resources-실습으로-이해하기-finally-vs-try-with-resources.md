---
layout: post
title: "[매일매일] 백엔드 기술 일기: Java Try-with-Resources 실습으로 이해하기: finally vs try-with-resources" 
date: 2025-07-16 18:54:58 +0900
categories: [jekyll, update]
---






실제 코드를 돌려보며 확인하는 예외 처리의 차이점​자바를 사용하다 보면 파일, 데이터베이스 연결, 네트워크 소켓 등의 자원(Resource)을 다루는 일이 많습니다. 이런 자원들은 사용 후 반드시 정리해야 하는데, Java 7부터 도입된 try-with-resources 구문이 이를 획기적으로 개선했습니다.​오늘은 직접 코드를 실습해보며 기존의 `finally` 방식과 `try-with-resources`의 차이점을 명확히 알아보겠습니다.




 







 



📌 try-with-resources란?try-with-resources는 자바 7부터 도입된 문법으로, 사용한 자원을 자동으로 해제(close)해 주는 try 문입니다.보통 데이터베이스 커넥션, 파일 스트림, 네트워크 소켓처럼반드시 닫아야 하는 자원을 다룰 때 사용합니다.




 















​🎯 정리하며 느낀 점




 






finally

try-with-resources

코드 길이

길고 중첩됨

짧고 깔끔

예외 출력

따로따로

메인 + suppressed

디버깅

불편

훨씬 쉽다

자원 닫기

직접 호출

자동






 



finally로는 null 체크하고 try-catch를 또 써야 했는데,try-with-resources는 선언만 하면 알아서 닫아주고, 예외도 한눈에 볼 수 있었습니다.​​🔍예제코드




 




// Source code is decompiled from a .class file using FernFlower decompiler.
public class TryWithResourcesTest {
   public TryWithResourcesTest() {
   }

   public static void main(String[] var0) {
      System.out.println("=== finally version ===");
      testFinally();
      System.out.println("\n=== try-with-resources version ===");
      testTryWithResources();
   }

   static void testFinally() {
      CustomResource var0 = null;

      try {
         var0 = new CustomResource();
         var0.process();
      } catch (Exception var10) {
         System.out.println("catch: " + var10.getMessage());
         var10.printStackTrace();
      } finally {
         if (var0 != null) {
            try {
               var0.close();
            } catch (Exception var9) {
               System.out.println("Exception in finally close(): " + var9.getMessage());
               var9.printStackTrace();
            }
         }

      }

   }

   static void testTryWithResources() {
      try {
         CustomResource var0 = new CustomResource();

         try {
            var0.process();
         } catch (Throwable var6) {
            try {
               var0.close();
            } catch (Throwable var5) {
               var6.addSuppressed(var5);
            }

            throw var6;
         }

         var0.close();
      } catch (Exception var7) {
         System.out.println("catch: " + var7.getMessage());
         var7.printStackTrace();
         Throwable[] var1 = var7.getSuppressed();
         int var2 = var1.length;

         for(int var3 = 0; var3 < var2; ++var3) {
            Throwable var4 = var1[var3];
            System.out.println("suppressed: " + var4.getMessage());
            var4.printStackTrace();
         }
      }

   }
}






 



​🔍 Try-with-Resources vs Finally 실습 전체 코드 및 주석 설명




 




/**
 * 🔍 Try-with-Resources vs Finally 실습 코드
 * 
 * 핵심 학습 포인트:
 * ✅ AutoCloseable 인터페이스 필요
 * ✅ 자원 자동 해제 메커니즘
 * ✅ 코드 간결성과 안전성
 * ✅ Suppressed Exception으로 디버깅 향상
 */

/**
 * 테스트용 자원 클래스
 * 
 * 🔑 핵심: AutoCloseable 인터페이스 구현 필수!
 * - try-with-resources 사용하려면 반드시 AutoCloseable 구현해야 함
 * - close() 메서드에서 정리 작업 수행
 */
class CustomResource implements AutoCloseable {
    
    /**
     * 자원 정리 메서드 (AutoCloseable 인터페이스 구현)
     * 
     * 🧪 실습 목적: 의도적으로 예외 발생시켜 차이점 확인
     * ✔️ 실제 실행해보니 try-with-resources에서는 이 예외가 "Suppressed"로 처리됨!
     */
    @Override
    public void close() throws Exception {
        System.out.println("close() called");
        throw new Exception("Close Exception occurred");  // 의도적 예외 발생
    }

    /**
     * 주요 작업 수행 메서드
     * 
     * 🧪 실습 목적: 주 작업 중 예외 발생시켜 예외 처리 방식 비교
     * ✔️ 실제 실행해보니 이게 "Primary Exception"이 됨
     */
    void process() throws Exception {
        System.out.println("process() called");
        throw new Exception("Primary Exception occurred");  // 의도적 예외 발생
    }
}

public class TryWithResourcesTest {
    public static void main(String[] args) {
        System.out.println("=== finally version ===");
        testFinally();

        System.out.println("\n=== try-with-resources version ===");
        testTryWithResources();
        
        // 🎯 실행 후 확인사항:
        // 1. 실행 순서의 차이
        // 2. 예외 처리 방식의 차이 
        // 3. Suppressed Exception 출력 여부
    }

    /**
     * 🔹 방법 1: 전통적인 finally 방식
     * 
     * ❌ 문제점들:
     * - 코드가 복잡하고 장황함 (중첩된 try-catch)
     * - null 체크 수동으로 해야 함
     * - 예외들이 독립적으로 처리되어 연관성 파악 어려움
     * 
     * 📊 실제 실행 결과:
     * 1. process() called
     * 2. catch: Primary Exception occurred  
     * 3. [Primary Exception 스택 트레이스]
     * 4. close() called
     * 5. Exception in finally close(): Close Exception occurred
     * 6. [Close Exception 스택 트레이스] ← 별도로 출력됨!
     */
    static void testFinally() {
        CustomResource resource = null;  // null 초기화 필요

        try {
            resource = new CustomResource();
            resource.process();  // 여기서 Primary Exception 발생
        } catch (Exception e) {
            // Primary Exception만 캐치됨
            System.out.println("catch: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 🔴 수동으로 자원 정리 해야 함
            if (resource != null) {  // null 체크 필수
                try {
                    resource.close();  // 여기서 Close Exception 발생
                } catch (Exception e) {
                    // Close Exception이 별도로 처리됨 → 정보 분산!
                    System.out.println("Exception in finally close(): " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }
        
        // ❌ 결과: 두 예외가 완전히 분리되어 출력됨
        // → 디버깅할 때 원인과 결과의 연관성 파악 어려움
    }

    /**
     * 🔹 방법 2: try-with-resources 방식 (Java 7+)
     * 
     * ✅ 장점들:
     * - 코드 간결함 (중첩 제거)
     * - 자동 자원 관리 (null 체크 불필요)
     * - Suppressed Exception으로 모든 예외 정보 통합
     * - 실행 순서 최적화 (close가 catch보다 먼저)
     * 
     * 📊 실제 실행 결과:
     * 1. process() called
     * 2. close() called  ← ⭐ catch 블록보다 먼저 실행됨!
     * 3. catch: Primary Exception occurred
     * 4. [Primary Exception 스택 트레이스]
     *    Suppressed: java.lang.Exception: Close Exception occurred  ← ⭐ 통합!
     * 5. suppressed: Close Exception occurred
     * 6. [Suppressed Exception 스택 트레이스]
     */
    static void testTryWithResources() {
        // 🟢 리소스를 try 괄호 안에서 선언 → 자동 관리
        try (CustomResource resource = new CustomResource()) {
            resource.process();  // 여기서 Primary Exception 발생
            
            // ⭐ 이 블록을 벗어날 때 자동으로 resource.close() 호출됨!
            //    심지어 예외가 발생해도 반드시 close() 실행됨
            
        } catch (Exception e) {
            // Primary Exception 캐치
            System.out.println("catch: " + e.getMessage());
            e.printStackTrace();  // 여기서 Suppressed Exception도 함께 출력됨!

            // 🔍 Suppressed Exception 확인 (학습용)
            for (Throwable suppressed : e.getSuppressed()) {
                System.out.println("suppressed: " + suppressed.getMessage());
                suppressed.printStackTrace();
            }
        }
        
        // ✅ 결과: 
        // - Primary Exception이 주 예외로 유지됨
        // - Close Exception이 "Suppressed"로 첨부됨
        // - 하나의 통합된 예외 정보로 완전한 컨텍스트 제공!
        // → 디버깅할 때 전체 상황을 한눈에 파악 가능
    }
}

/**
 * 🎓 실습 정리 및 핵심 키워드
 * 
 * 📌 필수 조건:
 * - AutoCloseable 인터페이스 구현 필요
 * 
 * 📌 주요 차이점:
 * 1. 실행 순서: finally (process→catch→close) vs try-with-resources (process→close→catch)
 * 2. 예외 처리: finally (분리된 예외) vs try-with-resources (통합된 Suppressed Exception)
 * 3. 코드 복잡도: finally (중첩 구조) vs try-with-resources (간결함)
 * 4. 안전성: finally (수동 관리) vs try-with-resources (자동 관리)
 * 
 * 📌 Suppressed Exception의 가치:
 * - 원본 예외(Primary) 보존
 * - 부가 예외(Close) 정보도 함께 제공  
 * - 완전한 컨텍스트로 디버깅 효율성 대폭 향상
 * 
 * 🚀 결론: try-with-resources는 단순한 문법 설탕이 아닌, 
 *          자원 관리와 예외 처리의 패러다임을 바꾼 혁신적 기능!
 */ 





 







 



  핵심 학습 포인트: ✅ 실제 실행 결과 기반이론이 아닌 실제 콘솔 출력 기반 설명독자가 직접 따라할 수 있는 검증된 코드✅ 시각적 비교표Apply to try-with-res...✅ 실습으로 증명된 인사이트"실제로 돌려보니 정말 다르다!"이론 vs 실제 실행의 차이점 명확히 제시✅ 단계별 학습 가능환경 준비 → 실습 → 결과 분석 → 심화 학습초보자도 따라할 수 있는 친절한 설명✅ 실전 활용까지여러 자원 동시 관리커스텀 자원 클래스 만들기Suppressed Exception 활용​​✔️ finally로 작성했을 때 close() 예외가 덮어써지는 걸 확인✔️ try-with-resources로 돌려보니 suppressed exception이 출력됨 ✔️ AutoCloseable 인터페이스가 꼭 필요함 → 이걸 코드에 주석으로 설명해두자 이거부터 하나하나 차근차근 써보자




 







 



예제 코드 실행 결과




 















​




 
