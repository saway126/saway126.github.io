import os
import subprocess
from datetime import datetime

# 글 자동 작성
today = datetime.today().strftime('%Y-%m-%d')
filename = f'_posts/{today}-hello-71stars.md'

with open(filename, 'w', encoding='utf-8') as f:
    f.write('''---
title: "Hello 71stars"
date: {} 00:00:00 +0900
layout: post
---
처음으로 올리는 글입니다! ✨
'''.format(today))

print(f"✅ 글 생성 완료: {filename}")

# Git add, commit, push 자동 실행
try:
    subprocess.run(["git", "add", "."], check=True)
    subprocess.run(["git", "commit", "-m", f"Auto: Add post {filename}"], check=True)
    subprocess.run(["git", "push"], check=True)
    print("🚀 Git push 완료!")
except subprocess.CalledProcessError as e:
    print(f"❗ Git 명령어 실행 중 오류 발생: {e}")
