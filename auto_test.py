import subprocess
from datetime import datetime
import os

# 사용자 입력 받기
title = input("글 제목을 입력하세요: ").strip()
content = input("글 내용을 입력하세요: ").strip()

# 파일 이름, 폴더 준비
today = datetime.today().strftime('%Y-%m-%d')
safe_title = title.replace(' ', '-').replace('/', '-')
filename = f"_posts/{today}-{safe_title}.md"

# _posts 폴더 없으면 생성
os.makedirs("_posts", exist_ok=True)

# Markdown 파일 작성
with open(filename, 'w', encoding='utf-8') as f:
    f.write(f"""---
title: "{title}"
date: {today} 00:00:00 +0900
layout: post
---

{content}
""")

print(f"✅ 글 생성 완료: {filename}")

# Git add, commit, push 자동 실행
try:
    subprocess.run(["git", "add", "."], check=True)
    subprocess.run(["git", "commit", "-m", f"Auto: Add post {filename}"], check=True)
    subprocess.run(["git", "push"], check=True)
    print("🚀 Git push 완료! 블로그 글이 등록되었습니다.")
except subprocess.CalledProcessError as e:
    print(f"❗ Git 명령어 실행 중 오류 발생: {e}")
