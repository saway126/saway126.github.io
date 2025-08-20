---
layout: home
title: Home
---

# 71stars 블로그에 오신 것을 환영합니다! 🚀

AI와 자동화의 만남을 다루는 블로그입니다.

## 최근 게시물

{% raw %}{% for post in site.posts limit:5 %}
- [{{ post.title }}]({{ post.url }})
{% endfor %}{% endraw %}

## 카테고리

{% raw %}{% for category in site.categories %}
- [{{ category[0] }}](/categories/{{ category[0] | slugify }})
{% endfor %}{% endraw %}
