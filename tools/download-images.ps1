# 네이버 블로그 이미지 다운로드 도구
# PowerShell 스크립트

param(
    [string]$BlogUrl = "https://blog.naver.com/71_stars",
    [string]$OutputPath = "assets/img/posts/naver-blog",
    [int]$MaxImages = 10
)

Write-Host "🖼️ 네이버 블로그 이미지 다운로드 도구" -ForegroundColor Green
Write-Host "블로그 URL: $BlogUrl" -ForegroundColor Yellow
Write-Host "저장 경로: $OutputPath" -ForegroundColor Yellow
Write-Host "최대 이미지 수: $MaxImages" -ForegroundColor Yellow
Write-Host ""

# 출력 폴더 생성
if (!(Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force
    Write-Host "✅ 출력 폴더 생성: $OutputPath" -ForegroundColor Green
}

Write-Host ""
Write-Host "📋 사용 방법:" -ForegroundColor Cyan
Write-Host "1. 네이버 블로그에서 이미지 우클릭 → '이미지 주소 복사'" -ForegroundColor White
Write-Host "2. 아래에 이미지 URL을 붙여넣기" -ForegroundColor White
Write-Host "3. Enter 키를 누르면 이미지가 다운로드됩니다" -ForegroundColor White
Write-Host "4. 'quit'을 입력하면 종료됩니다" -ForegroundColor White
Write-Host ""

$imageCount = 0

while ($imageCount -lt $MaxImages) {
    $imageUrl = Read-Host "이미지 URL을 입력하세요 (또는 'quit' 입력)"

    if ($imageUrl -eq "quit") {
        Write-Host "종료합니다." -ForegroundColor Yellow
        break
    }

    if ($imageUrl -eq "") {
        Write-Host "❌ URL을 입력해주세요." -ForegroundColor Red
        continue
    }

    try {
        # 파일명 추출
        $fileName = [System.IO.Path]::GetFileName($imageUrl)
        if ($fileName -eq "") {
            $fileName = "image-$($imageCount + 1).jpg"
        }

        # 파일 경로
        $filePath = Join-Path $OutputPath $fileName

        Write-Host "📥 다운로드 중: $fileName" -ForegroundColor Blue

        # 이미지 다운로드
        Invoke-WebRequest -Uri $imageUrl -OutFile $filePath -UseBasicParsing

        # 파일 크기 확인
        $fileSize = (Get-Item $filePath).Length
        $fileSizeKB = [math]::Round($fileSize / 1KB, 2)

        Write-Host "✅ 다운로드 완료: $fileName ($fileSizeKB KB)" -ForegroundColor Green

        $imageCount++

        # 남은 이미지 수 표시
        $remaining = $MaxImages - $imageCount
        Write-Host "📊 남은 이미지: $remaining 개" -ForegroundColor Cyan

    } catch {
        Write-Host "❌ 다운로드 실패: $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
}

Write-Host "🎉 총 $imageCount 개의 이미지를 다운로드했습니다!" -ForegroundColor Green
Write-Host "저장 위치: $OutputPath" -ForegroundColor Yellow

# 다운로드된 이미지 목록 표시
if (Test-Path $OutputPath) {
    Write-Host ""
    Write-Host "📁 다운로드된 이미지 목록:" -ForegroundColor Cyan
    Get-ChildItem $OutputPath | ForEach-Object {
        $sizeKB = [math]::Round($_.Length / 1KB, 2)
        Write-Host "  - $($_.Name) ($sizeKB KB)" -ForegroundColor White
    }
}
