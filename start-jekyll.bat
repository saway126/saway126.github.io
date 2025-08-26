@echo off
echo Jekyll 서버를 시작합니다...
echo 브라우저에서 http://localhost:4000 으로 접속하세요
echo 서버를 중단하려면 Ctrl+C를 누르세요
echo.
bundle exec jekyll serve --host localhost --port 4000
pause
