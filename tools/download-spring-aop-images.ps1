# Spring Boot AOP 포스트 이미지 다운로드 스크립트
Write-Host "Starting Spring Boot AOP Post Image Download..." -ForegroundColor Green

# Create folder
$folder = "assets/img/posts/backend/spring-aop"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "Created folder: $folder" -ForegroundColor Yellow
}

# Image URLs from Naver Blog
$images = @(
    @{name="01-tomorrow-me"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfMTI2/MDAxNzUzMTc0NDMxODQw.DxrlW9bRwOrl_7yeAYNJPwIHfFSVz3izj2S3kiVD4rQg.MzY-qafSA6MSSeKB3X3pc4rY36O1J76PSXONTTCJdrMg.JPEG/%EB%82%B4%EC%9D%BC%EC%9D%98_%EB%82%B4%EB%AA%A8%EC%8A%B5.jpg?type=w966"},
    @{name="02-typescript-infer"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfMTMz/MDAxNzUzMTcyODg4OTk2.UHmGilGaD4jwq0xOMBKMPv0szFIFnuwI8ybFOGCUuYcg.MabUiHMT8Z2s3GqZybwhrjcL4dyCNYtxH5uo0u4S4C0g.PNG/TypeScript_-_infer_%ED%82%A4%EC%9B%8C%EB%93%9C.png?type=w966"},
    @{name="03-one-to-one"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfMTU0/MDAxNzUzMTcyOTY5NDk1.UIckulYktFvjj-lxiNS5baf4sf6pHW8TUe4UUaQFShwg._HymmTh5v1NZDVuvDz2I5ZR8qcdq2EWhuz7ZL5eD3cgg.PNG/%EC%9B%90%ED%88%AC%EC%9B%90.png?type=w966"},
    @{name="04-bff"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfMTA2/MDAxNzUzMTczMDkwMzI1.kx-kv2MvXdgxDZYF1sHZjHNk5Qfm758SSjTsJMYFMzog.P3dW3q4ggodnJXhcQsJshqb1YlTWKcSU1ABMQLKNKC8g.PNG/BFF.png?type=w966"},
    @{name="05-iac"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfMTYz/MDAxNzUzMTczMjY5MTAw.oQV1Mur686OJ20kJRP3SLQOYNvAAlEhwZ8Ua8kUCZZEg.c4yFL9iiFo36SwE2lcELX3Q0Rcv3rIc5hcDGGT0lRawg.JPEG/IaC.jpg?type=w966"},
    @{name="06-hibernate"; url="https://postfiles.pstatic.net/MjAyNTA3MjJfNzgg/MDAxNzUzMTczNDQ0Mjg0.B5j-QnhXFu81MTL0wswIFKrZWDkJK_B-94fZWmsNvKMg.6jglBFcznlDz-7tJAs7PETQLzgM6Dz_pqqC06SH6J2og.PNG/hibernate.png?type=w966"}
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

Write-Host "`nStarting download of $total Spring Boot AOP images...`n" -ForegroundColor Magenta

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
    Write-Host "`nAll Spring Boot AOP images downloaded successfully!" -ForegroundColor Green
} else {
    Write-Host "`nSome images failed to download." -ForegroundColor Yellow
}

# Open folder
Write-Host "`nOpening folder..." -ForegroundColor Cyan
Start-Process "explorer.exe" -ArgumentList $folder
