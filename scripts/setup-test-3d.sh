#!/usr/bin/env bash
set -e

mkdir -p test-3d-system

# 존재 시에만 이동
if [ -d assets/js ]; then
    mv -f assets/js/3d-*.js test-3d-system/ 2>/dev/null || true
fi
mv -f *-demo.html test-3d-system/ 2>/dev/null || true

# README 생성/갱신
cat > test-3d-system/README.md <<'EOF'
# Test 3D System (local-only branch)

이 폴더는 **로컬 전용 테스트 브랜치(test-3d-system)** 에서만 사용됩니다.  
GitHub Pages에 배포하지 않으며, 운영(main)에는 영향이 없습니다.

## Local Run
```bash
bundle exec jekyll serve --host 0.0.0.0 --port 4100
# http://localhost:4100/test-3d-system/3d-demo.html (있다면)
# http://localhost:4100/test-3d-system/space-dolphin-demo.html (있다면)
```

## Merge to main (나중에)

운영에 포함할 파일만 `/labs/` 또는 `/assets/js` 로 옮긴 뒤,

`test-3d-system/` 폴더는 PR 전에 제거하세요.
EOF

# 안내 HTML(없을 때만)
if [ ! -f test-3d-system/space-dolphin-demo.html ]; then
    cat > test-3d-system/space-dolphin-demo.html <<'EOF'
<!doctype html>
<meta charset="utf-8">
<title>Space Dolphin — Local Test</title>
<body style="margin:0;background:#000;color:#ddd;font-family:system-ui">
    <div style="max-width:900px;margin:60px auto;padding:20px">
        <h1>Space + Dolphins — Local Test Branch</h1>
        <p>이 페이지는 <b>test-3d-system</b> 브랜치에서만 보이는 로컬 테스트용입니다.</p>
        <p>포트 4100에서 Jekyll 서버로 열어 확인하세요.</p>
    </div>
</body>
EOF
fi

echo "[OK] test-3d-system 준비 완료. 포트 4100으로 로컬 서버를 실행하세요."
