import requests
from bs4 import BeautifulSoup
import subprocess
from datetime import datetime
import os


def get_trending_articles():
    # 예시: 네이버 뉴스 IT 섹션
    url = 'https://news.naver.com/main/list.naver?mode=LSD&mid=sec&sid1=105'
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, 'html.parser')

    articles = []
    for li in soup.select('.list_body.newsflash_body li')[:3]:
        link_tag = li.find('a')
        if link_tag:
            link = link_tag['href']
            title = link_tag.get_text(strip=True)
            articles.append((title, link))

    return articles


def make_blog_post(articles):
    today = datetime.today().strftime('%Y-%m-%d')
    safe_title = "today-trends"
    filename = f"_posts/{today}-{safe_title}.md"

    os.makedirs("_posts", exist_ok=True)

    with open(filename, 'w', encoding='utf-8') as f:
        f.write(f"""---
title: "오늘의 트렌드"
date: {today} 09:00:00 +0900
layout: post
---

# 오늘의 트렌드

""")
        for title, link in articles:
            f.write(f"- [{title}]({link})\n")

    print(f"✅ 블로그 글 생성 완료: {filename}")
    return filename


def git_push(filename):
    try:
        subprocess.run(["git", "add", "."], check=True)
        subprocess.run(["git", "commit", "-m", f"Auto: Add {filename}"], check=True)
        subprocess.run(["git", "push"], check=True)
        print("🚀 Git push 완료!")
    except subprocess.CalledProcessError as e:
        print(f"❗ Git 명령어 실행 중 오류 발생: {e}")


def main():
    articles = get_trending_articles()
    filename = make_blog_post(articles)
    git_push(filename)


if __name__ == "__main__":
    main()
