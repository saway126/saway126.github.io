# 네이버 블로그 이미지 자동 다운로드 스크립트
Write-Host "🚀 네이버 블로그 이미지 자동 다운로드 시작!" -ForegroundColor Green

# 폴더 생성
$folder = "assets/img/posts/project/spring-boot-vue"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "📁 폴더 생성: $folder" -ForegroundColor Yellow
}

# 네이버 블로그 이미지 URL들 (실제 URL)
$naverImages = @(
    @{
        Name = "01-project-overview"
        Description = "프로젝트 구"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMjgw/MDAxNzU0MjgwNjYwNTU4.he5ai8POIhsXtBnOQPT8Qz9G5rMGQHj00FRtcwmlXdkg.bClETNRxXLEpkdi3PJkgIC2lzqxyQb5WyFNLSfhN8Ecg.PNG/403%EC%97%90%EB%9F%AC.png?type=w966"
    },
    @{
        Name = "02-maven-error"
        Description = "Maven 플러그인 에러"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMjk2/MDAxNzU0MjgwNjYwNTMy.YMQJ_sPp5sESFKsk4yDQv5dBgJO7HvnDgl4hlVAh81Ig.O-xeqdOFPwNGZg9t0HaO_rp1-9cXneSJepr2HDMFWsAg.PNG/500_%EC%97%90%EB%9F%AC.png?type=w966"
    },
    @{
        Name = "03-port-conflict"
        Description = "포트 충돌"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMTQ0/MDAxNzU0MjgwNjYwNTY4.Ze8wKCJZwD-De53fdIc2ptk24dA73YWz5h_1jm78yK8g.3OGT37-ORJvNjSCkSPBxslhAdw1BXumF-l5Kp2MnZlIg.PNG/%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EA%B3%B5%EB%B6%80_%ED%95%B4%EC%95%BC%EA%B2%A0%EC%A7%80.png?type=w966"
    },
    @{
        Name = "04-login-403"
        Description = "로그인 403 에러"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfNzkg/MDAxNzU0MjgwNjYwMzI4.o1H6cQWbumTCrwiFB5py9ufMOJZu3doawSbYT-SbgWMg.bRp1dqJvmhYbDSqhbM1HA_uuGw2-Dxez_NAWIJWcI2gg.PNG/%EB%84%A4%E3%85%90%ED%8A%B8%EC%9A%B0%ED%81%AC_%EB%A1%9C%EA%B7%B8%EA%B0%99%EC%9D%80%EB%8D%B0.png?type=w966"
    },
    @{
        Name = "05-connection-failed"
        Description = "연결 실패"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMTIg/MDAxNzU0MjgwNjYwMzMw.nQ-cP6Pex5WlZ4T1z7p8FL3bFwHfOnP_O66sklgiumgg.VKOHqQW9H4fsh_OX3z6s_SuzbFvb5eeNBPWztzalbGUg.PNG/%EB%94%94%EB%B9%84_%EC%97%B0%EA%B2%B0_%EB%AC%B8%EC%A0%9C%EC%9D%B8%EA%B0%80.png?type=w966"
    },
    @{
        Name = "06-cursor-ai"
        Description = "Cursor AI 사용"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMTU3/MDAxNzU0MjgwNjYwMzI5.SkJEjNX1h-QHQDwu6R-g-dw1K6NUBollEDaduloMD1Qg.bZOl1mpr9yolqbcKX2Sub1Gb-rcdoRV8ZvbeFF2AdPwg.PNG/%EC%83%9D%EA%B0%81%EB%B3%B4%EB%8B%A4_%EC%89%BD%EC%A7%80_%EC%95%8A%EB%84%A4.png?type=w966"
    },
    @{
        Name = "07-gemini-cli"
        Description = "Gemini CLI 사용"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMTkx/MDAxNzU0MjgwNjYwMzM1.Nr_zhS1e6VMtoBVKI87y0M9R0vm_NuPK2QpaMfUvo4og.qpebyPg2OTSQa8F6rAzERrkiejSUhpcHKE9LdTkuBFEg.PNG/%EC%97%91%EC%8B%9C%EC%98%A4%EC%8A%A4_%EC%97%90%EB%9F%AC_%EB%9C%A8%EB%84%A4.png?type=w966"
    },
    @{
        Name = "08-project-complete"
        Description = "프로젝트 완성"
        Url = "https://postfiles.pstatic.net/MjAyNTA4MDRfMTI2/MDAxNzU0MjgwNjYwMzI2.lIv9F0GzONR-VcpAT4CZHEV6cAcO96DWoYnSx5ClTvMg.iJISSHfm4M6lubOAyZuSbNX5e4qLZDcOORhQCQNKrPcg.PNG/%EC%9D%B4%EB%B2%88_%EB%98%90_%EB%AC%B4%EC%8A%B9_%EC%97%90%EB%9F%AC%EC%A7%80.png?type=w966"
    }
)

# 다운로드 함수
function Download-NaverImage {
    param(
        [string]$Name,
        [string]$Description,
        [string]$Url
    )

    $fileName = "$Name.png"
    $filePath = Join-Path $folder $fileName

    try {
        Write-Host "📥 다운로드: $Description" -ForegroundColor Cyan

        # 네이버 블로그 이미지 다운로드
        Invoke-WebRequest -Uri $Url -OutFile $filePath -UseBasicParsing

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
$totalCount = $naverImages.Count

Write-Host "`n📊 총 $totalCount개 네이버 블로그 이미지 다운로드 시작...`n" -ForegroundColor Magenta

foreach ($image in $naverImages) {
    if (Download-NaverImage -Name $image.Name -Description $image.Description -Url $image.Url) {
        $successCount++
    }
    Start-Sleep -Milliseconds 1000  # 네이버 서버 부하 방지
}

# 결과 요약
Write-Host "`n📈 다운로드 완료!" -ForegroundColor Green
Write-Host "   성공: $successCount/$totalCount" -ForegroundColor Green
Write-Host "   저장 위치: $folder" -ForegroundColor Yellow

if ($successCount -eq $totalCount) {
    Write-Host "`n🎉 모든 네이버 블로그 이미지가 성공적으로 다운로드되었습니다!" -ForegroundColor Green
    Write-Host "   이제 Jekyll 블로그에서 사용할 수 있습니다." -ForegroundColor Cyan
} else {
    Write-Host "`n⚠️  일부 이미지 다운로드에 실패했습니다." -ForegroundColor Yellow
    Write-Host "   실패한 이미지는 수동으로 다운로드해주세요." -ForegroundColor Yellow
}

# 폴더 열기
Write-Host "`n📁 다운로드된 이미지 폴더를 엽니다..." -ForegroundColor Cyan
Start-Process "explorer.exe" -ArgumentList $folder
