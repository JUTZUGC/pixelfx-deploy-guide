# pixelfx 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/patch-gg/pixelfx#use-one
# 更新日期：2026-11-02
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

npm i github:patch-gg/pixelfx
Write-Host "装好后在项目里 import { createFx } from 'pixelfx'"
Write-Host "需要精灵表时运行 node node_modules/pixelfx/tools/sheets.mjs"

Write-Host ''

Write-Host '部署完成'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/patch-gg/pixelfx#use-one'
