# 🖼️ 블로그 이미지 관리 가이드

## 📁 폴더 구조

```
assets/img/
├── commons/           # 공통 이미지 (프로필, 아바타 등)
├── favicons/          # 파비콘 및 앱 아이콘
└── posts/             # 블로그 포스트용 이미지
    ├── backend/       # 백엔드 관련 포스트 이미지
    ├── frontend/      # 프론트엔드 관련 포스트 이미지
    ├── devops/        # DevOps 관련 포스트 이미지
    ├── ai/            # AI/ML 관련 포스트 이미지
    └── project/       # 프로젝트 관련 포스트 이미지
```

## 📝 이미지 사용 규칙

### **파일명 규칙**
- **형식**: `YYYY-MM-DD-설명.확장자`
- **예시**: `2025-08-22-spring-boot-architecture.png`
- **크기**: 최대 2MB (웹 최적화)

### **이미지 포맷**
- **PNG**: 스크린샷, 다이어그램, 투명도 필요한 경우
- **JPG**: 사진, 복잡한 이미지
- **WebP**: 최신 브라우저 지원 (선택사항)
- **SVG**: 아이콘, 로고, 벡터 그래픽

### **마크다운에서 사용법**
```markdown
![설명](/assets/img/posts/backend/2025-08-22-spring-boot-architecture.png){: .normal w='600' h='400' }

<!-- 반응형 이미지 -->
![설명](/assets/img/posts/frontend/2025-08-22-react-hooks.png){: .normal .img-fluid }

<!-- 왼쪽 정렬 -->
![설명](/assets/img/posts/devops/2025-08-22-docker-compose.png){: .left .normal w='300' h='200' }
```

## 🔄 네이버 블로그 이미지 가져오기

### **방법 1: 직접 다운로드 (권장)**
1. 네이버 블로그에서 이미지 우클릭
2. "이미지 주소 복사" 또는 "이미지 저장"
3. 적절한 폴더에 저장 후 마크다운에 추가

### **방법 2: 개발자 도구 활용**
1. F12 → Network 탭
2. 이미지 클릭 시 로드되는 파일 확인
3. 이미지 URL 복사하여 다운로드

### **방법 3: 브라우저 확장 프로그램**
- Image Downloader
- Bulk Image Downloader
- Save All Images

## 📊 이미지 최적화

### **압축 도구**
- **온라인**: TinyPNG, Compressor.io
- **데스크톱**: ImageOptim, FileOptimizer
- **명령줄**: ImageMagick, OptiPNG

### **권장 크기**
- **썸네일**: 300x200px
- **일반**: 600x400px
- **큰 이미지**: 800x600px
- **최대**: 1200x800px

## 🚫 주의사항

1. **저작권**: 네이버 블로그 이미지 사용 시 원작자 허가 확인
2. **용량**: GitHub Pages 제한 고려 (저장소 크기)
3. **성능**: 이미지 크기 및 포맷 최적화
4. **접근성**: alt 텍스트 필수 입력

## 📋 체크리스트

- [ ] 이미지 파일명 규칙 준수
- [ ] 적절한 폴더에 저장
- [ ] 이미지 크기 최적화
- [ ] alt 텍스트 입력
- [ ] 마크다운 문법 확인
- [ ] 로컬에서 이미지 로딩 테스트

---

**마지막 업데이트**: 2025-08-22
**담당자**: 김기성
