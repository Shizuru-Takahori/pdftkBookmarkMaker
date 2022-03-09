@echo off
rem エンコード:shiftJIS

echo ---pdftkしおりimportのbat---
@echo.
@echo.

rem スクリプト格納ディレクトリ
set scriptDir=%~dp0

rem インポート先PDFを入力

    set /P importedPdf="しおりをインポートしたいpdfをここにドラック&ドロップ: "

    rem ファイル名取得
    for %%f in ("%importedPdf%") do (
    set nameImportedPdf=%%~nf
    )
    @echo.
    echo インポート先PDF: %nameImportedPdf%

rem しおりtxtを入力

    set /P bookmarkFile="しおりtxtをドラック&ドロップ: "

    rem ファイル名とディレクトリ取得
    for %%f in ("%bookmarkFile%") do (
    set bookMarkFileName=%%~nxf
    set bookmarkDir=%%~dpf
    )
    @echo.
    echo しおりtxt: %bookMarkFileName%

    rem txtファイルのディレクトリがスクリプト格納ディレクトリと異なる場合コピー
    if not %bookmarkDir%==%scriptDir% (
        copy %bookmarkFile% %scriptDir%
    )

rem 出力pdfの名前を定義

    rem 先頭に付ける文字列
    set mod=bookmarked-

    set outputName=%mod%%nameImportedPdf%.pdf

rem pdftek実行
@echo.
echo pdftek実行
@echo.

PAUSE

@echo on
pdftk "%importedPdf%" update_info_utf8 %bookMarkFileName% output %outputName%
@echo off

@echo.
echo 完了ファイル保存先: %scriptDir%%outputName%
@echo.

PAUSE
