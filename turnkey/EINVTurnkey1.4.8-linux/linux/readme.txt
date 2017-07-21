安裝步驟:
1. 使用TurnKey需搭配關聯式資料庫，並根據 "DBSchema" 目錄中的資料庫剛要建立資料表，可選用的資料庫軟體如 "DBSchema" 目錄中提供
2. 若使用者沒有偏好的資料庫，建議可使用 PostgreSQL, 安裝方式可參考 "二代電子發票 PostgreSQL資料庫安裝參考說明.doc"
3. 請先將Turnkey的zip檔(EINVTurnkeyX.X.X-linux.zip)，unzip到使用者欲安裝的目錄下(unzip EINVTurnkeyX.X.X-linux.zip -d $使用者目錄)。
4. 修改runFirst.sct及einvTurnkey.sct執行權限為可執行(chmod a+x runFirst.sct einvTurnkey.sct)
5. 執行runFirst.sct進行環境設定
6. 執行einvTurnkey.sct, 執行Turnkey，詳細操作請參考 "二代電子發票Turnkey 使用說明書.doc"
7. 需搭配Xwindow及中文字集包，以正常顯示中文
8. 請確認JDK版本為1.6以上
注意事項：請至Turnkey安裝目錄下執行Script，勿設入profile的Path中，避免程式無法啟動。

檔案說明: 
setenv                    設定環境變數
runFirst.sct              執行環境設定
einvTurnkey.sct           執行Turnkey
runUpgrade.sct            執行更新程式   
