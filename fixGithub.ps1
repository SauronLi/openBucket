# 仅替换 json 文件中 url 字段的未加速 github.com 链接
Get-ChildItem -Path .\bucket\ -Filter *.json | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace '("url"\s*:\s*")https://github.com(?!/hk\.gh-proxy\.com)([^"]*)"', '${1}https://hk.gh-proxy.com/https://github.com${3}"'
    Set-Content $_.FullName -Value $newContent
}
