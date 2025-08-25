# Simple Naver Blog Image Downloader
Write-Host "Starting Naver Blog Image Download..." -ForegroundColor Green

# Create folder
$folder = "assets/img/posts/project/spring-boot-vue"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "Created folder: $folder" -ForegroundColor Yellow
}

# Image URLs from Naver Blog
$images = @(
    @{name="01-project-overview"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMjgw/MDAxNzU0MjgwNjYwNTU4.he5ai8POIhsXtBnOQPT8Qz9G5rMGQHj00FRtcwmlXdkg.bClETNRxXLEpkdi3PJkgIC2lzqxyQb5WyFNLSfhN8Ecg.PNG/403%EC%97%90%EB%9F%AC.png?type=w966"},
    @{name="02-maven-error"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMjk2/MDAxNzU0MjgwNjYwNTMy.YMQJ_sPp5sESFKsk4yDQv5dBgJO7HvnDgl4hlVAh81Ig.O-xeqdOFPwNGZg9t0HaO_rp1-9cXneSJepr2HDMFWsAg.PNG/500_%EC%97%90%EB%9F%AC.png?type=w966"},
    @{name="03-port-conflict"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMTQ0/MDAxNzU0MjgwNjYwNTY4.Ze8wKCJZwD-De53fdIc2ptk24dA73YWz5h_1jm78yK8g.3OGT37-ORJvNjSCkSPBxslhAdw1BXumF-l5Kp2MnZlIg.PNG/%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EA%B3%B5%EB%B6%80_%ED%95%B4%EC%95%BC%EA%B2%A0%EC%A7%80.png?type=w966"},
    @{name="04-login-403"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfNzkg/MDAxNzU0MjgwNjYwMzI4.o1H6cQWbumTCrwiFB5py9ufMOJZu3doawSbYT-SbgWMg.bRp1dqJvmhYbDSqhbM1HA_uuGw2-Dxez_NAWIJWcI2gg.PNG/%EB%84%A4%E3%85%90%ED%8A%B8%EC%9A%B0%ED%81%AC_%EB%A1%9C%EA%B7%B8%EA%B0%99%EC%9D%80%EB%8D%B0.png?type=w966"},
    @{name="05-connection-failed"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMTIg/MDAxNzU0MjgwNjYwMzMw.nQ-cP6Pex5WlZ4T1z7p8FL3bFwHfOnP_O66sklgiumgg.VKOHqQW9H4fsh_OX3z6s_SuzbFvb5eeNBPWztzalbGUg.PNG/%EB%94%94%EB%B9%84_%EC%97%B0%EA%B2%B0_%EB%AC%B8%EC%A0%9C%EC%9D%B8%EA%B0%80.png?type=w966"},
    @{name="06-cursor-ai"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMTU3/MDAxNzU0MjgwNjYwMzI5.SkJEjNX1h-QHQDwu6R-g-dw1K6NUBollEDaduloMD1Qg.bZOl1mpr9yolqbcKX2Sub1Gb-rcdoRV8ZvbeFF2AdPwg.PNG/%EC%83%9D%EA%B0%81%EB%B3%B4%EB%8B%A4_%EC%89%BD%EC%A7%80_%EC%95%8A%EB%84%A4.png?type=w966"},
    @{name="07-gemini-cli"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMTkx/MDAxNzU0MjgwNjYwMzM1.Nr_zhS1e6VMtoBVKI87y0M9R0vm_NuPK2QpaMfUvo4og.qpebyPg2OTSQa8F6rAzERrkiejSUhpcHKE9LdTkuBFEg.PNG/%EC%97%91%EC%8B%9C%EC%98%A4%EC%8A%A4_%EC%97%90%EB%9F%AC_%EB%9C%A8%EB%84%A4.png?type=w966"},
    @{name="08-project-complete"; url="https://postfiles.pstatic.net/MjAyNTA4MDRfMTI2/MDAxNzU0MjgwNjYwMzI2.lIv9F0GzONR-VcpAT4CZHEV6cAcO96DWoYnSx5ClTvMg.iJISSHfm4M6lubOAyZuSbNX5e4qLZDcOORhQCQNKrPcg.PNG/%EC%9D%B4%EB%B2%88_%EB%98%90_%EB%AC%B4%EC%8A%B9_%EC%97%90%EB%9F%AC%EC%A7%80.png?type=w966"}
)

# Download function
function Download-Image {
    param($name, $url)

    $file = "$folder/$name.png"

    try {
        Write-Host "Downloading: $name" -ForegroundColor Cyan
        Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing

        $size = (Get-Item $file).Length
        if ($size -gt 0) {
            $sizeKB = [math]::Round($size/1KB, 2)
            Write-Host "  Success: $name ($sizeKB KB)" -ForegroundColor Green
            return $true
        } else {
            Write-Host "  Failed: $name (0 bytes)" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "  Error: $name - $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Main download
$success = 0
$total = $images.Count

Write-Host "`nStarting download of $total images...`n" -ForegroundColor Magenta

foreach ($img in $images) {
    if (Download-Image -name $img.name -url $img.url) {
        $success++
    }
    Start-Sleep -Milliseconds 1000
}

# Results
Write-Host "`nDownload Complete!" -ForegroundColor Green
Write-Host "Success: $success/$total" -ForegroundColor Green
Write-Host "Location: $folder" -ForegroundColor Yellow

if ($success -eq $total) {
    Write-Host "`nAll images downloaded successfully!" -ForegroundColor Green
} else {
    Write-Host "`nSome images failed to download." -ForegroundColor Yellow
}

# Open folder
Write-Host "`nOpening folder..." -ForegroundColor Cyan
Start-Process "explorer.exe" -ArgumentList $folder
