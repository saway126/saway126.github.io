---
layout: post
title: "[매일매일]프론트 엔드 기술 일기: npm install과 npm ci의 차이점" 
date: 2025-07-18 18:30:12 +0900
categories: [jekyll, update]
---






npm install과 npm ci(clean-install) 모두 의존성 목록을 설치하는 커맨드이지만, 세부 동작에 차이가 있습니다. 요약하면, npm ci는 npm install에 비해 의존성의 버전을 엄격하게 유지합니다.​첫째, npm install은 package.json에 명시된 version range 내에서 다른 버전을 설치할 가능성이 있지만, npm ci는 오직 package-lock.json에 정확하게 표기된 특정 버전을 따릅니다. 이로 인해 예기치 않게 다른 버전의 의존성을 설치하는 일을 방지합니다. 더불어 정확히 명시된 버전을 설치하므로 버전을 결정하기 위한 연산을 수행할 필요가 없어 설치 속도에서 유리한 측면이 있습니다.​둘째, npm install은 package-lock.json을 변경할 가능성이 있지만, npm ci는 절대 변경하지 않습니다. 이러한 특징으로 인해 npm ci는 의존성 목록의 버전을 변경없이 일관되게 유지할 수 있게 해줍니다.​셋째, npm ci는 매번 node_modules을 삭제한 후 설치합니다. 이를 통해 이전에 설치된 의존성과의 충돌로 인한 문제를 방지합니다. 또한, 오로지 package-lock.json에 따라서 매번 동일한 의존성을 설치할 것을 확실하게 보장합니다.




 







 



이러한 차이점들로 인해 npm ci는 CI/CD 환경에서 빌드 과정의 일관성을 보장하기 위한 목적으로 사용되는 경우가 많습니다.​npm ci를 로컬 개발 환경에서도 사용하면 안 되나요? 🤔가능합니다. 하지만 npm ci는 node_modules을 매번 모두 삭제하고 다시 설치하기 때문에 불필요한 시간이 소요될 수 있습니다. 따라서, 로컬에서는 일반적으로 npm install을 사용하고, CI/CD 환경에서는 npm ci를 사용하는 경우가 많습니다. 다만, 팀 내에서 의존성 버전을 엄격하게 맞추는 것이 중요하다고 판단되면 로컬 환경에서도 npm ci를 사용할 수 있습니다.




 
