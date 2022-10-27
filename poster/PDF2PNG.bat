echo off
setlocal enabledelayedexpansion
echo ============convert start============
 
for /f %%i in ('dir /b *.pdf') do (
 
set src=%%i
set des=./%%~ni.png
 
magick convert -density 600 !src! -quality 90 !des!
 
echo !src! !des!
)
 
echo ============convert end============