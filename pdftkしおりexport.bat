@echo off
rem エンコード:shiftJIS

echo ---pdftkしおりexportのbat---
@echo.
@echo.


rem スクリプト格納ディレクトリ
set scriptDir=%~dp0

rem エクスポートPDFを入力

    set /P orignalPdf="しおりをエクスポートしたいpdfをここにドラック&ドロップ: "

    rem ファイル名取得
    for %%f in ("%orignalPdf%") do (
    set nameOrignalPdf=%%~nf
    )
    @echo.
    echo エクスポート元PDF: %nameOrignalPdf%

rem エクスポートtxtの名前を定義

    rem 先頭に付ける文字列
    set mod=bookmarks-

    set outputName=%mod%%nameOrignalPdf%.txt

rem pdftek実行
@echo.
echo pdftek実行
@echo.
PAUSE

@echo on
pdftk "%orignalPdf%" dump_data_utf8 output "%outputName%"
@echo off

@echo.
echo ファイル保存先: %scriptDir%%outputName%
@echo.

PAUSE


