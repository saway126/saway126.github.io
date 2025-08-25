# JavaScript Call by Reference 포스트 이미지 다운로드 스크립트
Write-Host "Starting JavaScript Call by Reference Post Image Download..." -ForegroundColor Green

# Create folder
$folder = "assets/img/posts/frontend/javascript-call-by-reference"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "Created folder: $folder" -ForegroundColor Yellow
}

# Image URLs from Naver Blog
$images = @(
    @{name="01-authentication-vs-authorization"; url="https://postfiles.pstatic.net/MjAyNTA3MTdfMzIg/MDAxNzUyNzI2NDkzODky.aWUsuA3UEpQRGAXjAcjbHDjqpFWU2E3mvdUqoznZta8g.lVU88aa0UamtkW7HjYm74uumHzc6OWfd7POeyxqNQMUg.PNG/body-id101-authentication-vs-authorization.png?type=w966"},
    @{name="02-401-error"; url="https://postfiles.pstatic.net/MjAyNTA3MTdfMjQx/MDAxNzUyNzI1MDQ3MDI1.rwID259qQ_R5usLuj2BqUUOmwEmd1-mwms-pqVOnBfQg.w_8a0GXKlfRawbr6wjdVrksugOn7-3yBUGun1P_AqU0g.PNG/401%EC%97%90%EB%9F%AC_%EB%B8%94%EB%A1%9C%EA%B7%B8%EC%9A%A9.png?type=w966"},
    @{name="03-authentication-illustration"; url="https://postfiles.pstatic.net/MjAyNTA3MTdfMjkg/MDAxNzUyNzI2NDMwMzQx.BeEq7KjAO-OBX3dZZc3gVG3WfSoU4g7yMzSNdS2jFbMg.jsIskpiCBldDT9Yo7AeFVY9hEfvtYgsepsF0rMTrW8wg.PNG/%EC%9D%B8%EC%A6%9D_%EC%9D%BC%EB%9F%AC.png?type=w966"},
    @{name="04-authorization-illustration"; url="https://postfiles.pstatic.net/MjAyNTA3MTdfMTg4/MDAxNzUyNzI2NDM5Mjcx.qGRoKJrl7V6GbLikGnT1U0UuyMrz-LX9aFZKOtC_cjgg.IC0YL8xAIRezIR-m_Oa-lp66pDHY-KsCLRbB5nginO8g.PNG/%EC%9D%B8%EA%B0%80_%EC%9D%BC%EB%9F%AC.png?type=w966"}
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

Write-Host "`nStarting download of $total JavaScript Call by Reference images...`n" -ForegroundColor Magenta

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
    Write-Host "`nAll JavaScript Call by Reference images downloaded successfully!" -ForegroundColor Green
} else {
    Write-Host "`nSome images failed to download." -ForegroundColor Yellow
}

# Open folder
Write-Host "`nOpening folder..." -ForegroundColor Cyan
Start-Process "explorer.exe" -ArgumentList $folder
