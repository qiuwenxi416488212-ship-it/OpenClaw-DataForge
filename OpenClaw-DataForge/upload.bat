@echo off
echo ========================================
echo   OpenClaw-DataForge 上传脚本
echo ========================================
echo.

cd /d "%~dp0OpenClaw-DataForge"

echo [1/5] 检查并初始化Git...
if not exist ".git" (
    git init
    echo   Git 初始化完成
) else (
    echo   Git 已初始化
)

echo.
echo [2/5] 添加文件...
git add .

echo.
echo [3/5] 提交更改...
git commit -m "Initial commit: OpenClaw-DataForge - Data Processing Tools Suite"

echo.
echo [4/5] 添加远程仓库...
echo   请在下方输入你的GitHub仓库地址
echo   格式: https://github.com/你的用户名/OpenClaw-DataForge.git
echo.

set /p remote_url="远程仓库地址: "

if "%remote_url%"=="" (
    echo   使用默认地址...
    git remote add origin https://github.com/XiLi/OpenClaw-DataForge.git
) else (
    git remote add origin %remote_url%
)

echo.
echo [5/5] 推送到GitHub...
git push -u origin main

echo.
echo ========================================
echo   上传完成!
echo ========================================
echo.
pause