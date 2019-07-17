@echo off
cd /d %~dp0

rem 第一引数のファイルの中から、第三引数の文字列が含まれる行を抽出し、第二引数のファイルへコピーする
set from_filename=%1
set to_filename=%2
set ID=%3

find "%ID%" < %from_filename% > %to_filename%
