//読み込み時に起動
//参考 https://qiita.com/void_vtuber/items/a0c81392ce57b49dbb61
function onOpen() {
  //メニューバーにカスタムメニューを追加
  const spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  const entries = [{
    name : "txtダウンロード",
    functionName : "main"
  }];
  spreadsheet.addMenu("txtダウンロード", entries);
};

//参考 https://qiita.com/void_vtuber/items/a0c81392ce57b49dbb61
function main() {
  const html = HtmlService.createTemplateFromFile("dialog").evaluate();  
  SpreadsheetApp.getUi().showModalDialog(html, "ファイルダウンロード");
}


function getBookmarks() {

  const sheet = SpreadsheetApp.getActiveSheet();
  
  //最終行･最終列を取得
  const lastRow = sheet.getLastRow();
  const lastColum = sheet.getLastColumn();
  
  console.log('最終行: %s, 最終列: %s', lastRow, lastColum)

  var txt = '';

  for(let r = 1; r <= lastRow; r++){
    const bookmark = sheet.getRange(r, 1, 1, lastColum).getValues()[0];

    //配列の最後からタイトルまでの空要素を削除
    for(let l = bookmark.length - 1; l > 0; l--){
      if(bookmark[l] !== ''){
        break
      }
      bookmark.pop();
    }

    const begin = 'BookmarkBegin\n';
    const level = 'BookmarkLevel: ' + (bookmark.length - 1) + '\n';
    const title = 'BookmarkTitle: ' + bookmark[(bookmark.length - 1)] + '\n';
    const page = 'BookmarkPageNumber: ' + bookmark[(bookmark.length - 2)] + '\n';
    
    const temp = begin + title + level + page;
    
    txt = txt + temp + '\n';
  }

  console.log(txt)

  return txt;

}





