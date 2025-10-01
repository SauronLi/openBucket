# 仅替换未加速的 github.com 链接
Get-ChildItem -Path .\bucket\ -Filter *.json | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    # 只替换未包含 hk.gh-proxy.com 的 github.com 链接
    $newContent = $content -replace '(?<!hk\.gh-proxy\.com\/https:\/\/github\.com)', 'https://hk.gh-proxy.com/https://github.com'
    Set-Content $_.FullName -Value $newContent
}
