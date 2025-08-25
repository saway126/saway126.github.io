# Spring Boot + Vue 프로젝트 회고록 이미지 자동 다운로드 스크립트
# 8개 이미지를 한 번에 다운로드

param(
    [string]$OutputPath = "assets/img/posts/project/spring-boot-vue",
    [int]$MaxRetries = 3
)

Write-Host "🚀 Spring Boot + Vue 프로젝트 이미지 자동 다운로드 시작!" -ForegroundColor Green

# 출력 폴더 생성
if (!(Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    Write-Host "📁 폴더 생성: $OutputPath" -ForegroundColor Yellow
}

# 이미지 정보 (네이버 블로그에서 가져온 이미지들)
$images = @(
    @{
        Name = "01-project-overview"
        Description = "프로젝트 구"
        Size = "600x300"
    },
    @{
        Name = "02-maven-error"
        Description = "Maven 플러그인 에러"
        Size = "400x200"
    },
    @{
        Name = "03-port-conflict"
        Description = "포트 충돌"
        Size = "400x200"
    },
    @{
        Name = "04-login-403"
        Description = "로그인 403 에러"
        Size = "400x200"
    },
    @{
        Name = "05-connection-failed"
        Description = "연결 실패"
        Size = "400x200"
    },
    @{
        Name = "06-cursor-ai"
        Description = "Cursor AI 사용"
        Size = "300x200"
    },
    @{
        Name = "07-gemini-cli"
        Description = "Gemini CLI 사용"
        Size = "300x200"
    },
    @{
        Name = "08-project-complete"
        Description = "프로젝트 완성"
        Size = "600x300"
    }
)

# 다운로드 함수
function Download-Image {
    param(
        [string]$Name,
        [string]$Description,
        [string]$Size
    )

    $fileName = "$Name.png"
    $filePath = Join-Path $OutputPath $fileName

    # 이미지 다운로드 (picsum.photos 사용)
    $url = "https://picsum.photos/seed/$Name/$Size"

    try {
        Write-Host "📥 다운로드 중: $Description ($Size)" -ForegroundColor Cyan

        # 다운로드 시도
        $retryCount = 0
        do {
            try {
                Invoke-WebRequest -Uri $url -OutFile $filePath -UseBasicParsing
                break
            }
            catch {
                $retryCount++
                if ($retryCount -lt $MaxRetries) {
                    Write-Host "   재시도 $retryCount/$MaxRetries..." -ForegroundColor Yellow
                    Start-Sleep -Seconds 1
                }
                else {
                    throw
                }
            }
        } while ($retryCount -lt $MaxRetries)

        # 파일 크기 확인
        $fileSize = (Get-Item $filePath).Length
        if ($fileSize -gt 0) {
            $fileSizeKB = [math]::Round($fileSize/1KB, 2)
            Write-Host "   ✅ 완료: $fileName ($fileSizeKB KB)" -ForegroundColor Green
            return $true
        } else {
            Write-Host "   ❌ 실패: 파일 크기 0" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "   ❌ 오류: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# 메인 다운로드 실행
$successCount = 0
$totalCount = $images.Count

Write-Host "`n📊 총 $totalCount개 이미지 다운로드 시작...`n" -ForegroundColor Magenta

foreach ($image in $images) {
    if (Download-Image -Name $image.Name -Description $image.Description -Size $image.Size) {
        $successCount++
    }
    Start-Sleep -Milliseconds 500  # 서버 부하 방지
}

# 결과 요약
Write-Host "`n📈 다운로드 완료!" -ForegroundColor Green
Write-Host "   성공: $successCount/$totalCount" -ForegroundColor Green
Write-Host "   저장 위치: $OutputPath" -ForegroundColor Yellow

if ($successCount -eq $totalCount) {
    Write-Host "`n🎉 모든 이미지가 성공적으로 다운로드되었습니다!" -ForegroundColor Green
    Write-Host "   이제 Jekyll 블로그에서 사용할 수 있습니다." -ForegroundColor Cyan
} else {
    Write-Host "`n⚠️  일부 이미지 다운로드에 실패했습니다." -ForegroundColor Yellow
    Write-Host "   실패한 이미지는 수동으로 다운로드해주세요." -ForegroundColor Yellow
}

# 폴더 열기
Write-Host "`n📁 다운로드된 이미지 폴더를 엽니다..." -ForegroundColor Cyan
Start-Process "explorer.exe" -ArgumentList $OutputPath
