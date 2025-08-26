Write-Host "Jekyll 서버를 시작합니다..." -ForegroundColor Green
Write-Host "브라우저에서 http://localhost:4000 으로 접속하세요" -ForegroundColor Yellow
Write-Host "서버를 중단하려면 Ctrl+C를 누르세요" -ForegroundColor Red
Write-Host ""

try {
    bundle exec jekyll serve --host localhost --port 4000
} catch {
    Write-Host "오류가 발생했습니다: $_" -ForegroundColor Red
    Read-Host "아무 키나 누르면 종료됩니다"
}
