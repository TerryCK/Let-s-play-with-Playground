##iOS 面試問題預測：

* 最近這兩天你有學到什麼知識/技能麼？
    * Protocol-Oriented Programming
    * Extension & protocol
    * 實作「GoStation」專案的in-App Purchase 中
	
* 最近有做過比較酷或者比較有挑戰的項目麼？
    * 串接全台灣共享單車的即時資料 - 整合不同API為單一窗口使用
    * 實作Gogoro全台充電站地圖，並客製自己app中打卡功能，透過演算法merge data model 
* 最近看過的書/文章有哪些？
    * Hacking with Swift “Pro Swift” 主要是POP章節
* 為什麼要學習編程，編程對你而言的樂趣在哪兒？
    * 透過公司/個人的程式邏輯設計流程解決人們的痛點所帶來的成就感
    * Swift是一個結合多種面相的語言，一開始覺得非常容易上手，但隨著成長與深入，Swift中發掘更多有趣的彈性設計如: OOP、POP、FOP
    * 當你學習到不同開發概念時所帶來的成就感與驕傲感。
* 如果一個函數10次中有7次正確，3次錯誤，問題可能出現在哪裡？
    1. 輸入錯誤
    2. 執行序錯誤
    3. 函數設計
        1. 先做git branch - issue 
        2. 確認10次的輸入參數是否一致(排除輸入錯誤)
        3. 下中斷點，確認10次執行序是否一致(排除執行序錯誤)
        4. 檢查函數裡的邏輯(排除函數設計錯誤)
* 自身最大優點是什麼，怎麼證明？
    * 負責、積極，路遙知馬力，時間會證明。
* 有沒有在 GitHub 上發布過開原始碼，參與過開源項目？
    * 有，相關開源專案請參考：https://goo.gl/n6woJX
* 你最近遇到過的一個技術挑戰是什麼？怎麼解決的？
* 開發常用的工具有哪些？
    * git, cocoapods, xcode, json reader, source tree
* 熟悉 CocoaPods 麼？能大概講一下工作原理麼？
    * cocoapods 主要是依據該套件的 git repository 以及指定的版本來控管套件
    * 公開的Pods： 從CocoaPods的server讀取並依據Podspec的內容安裝套件
    * 私密Pods：的則需要指定路徑到該Podspec的所在位置
        * CocoaPods原理:
        1. Pods項目最終會編譯成一個名為libPods.a的文件,主項目只需要依賴這個.a文件即可
        2. 對於資源文件,CocoaPods提供了一個名為Pods-resources.sh的bash腳本,該腳本在每次項目編譯的時候都會執行,將第三方的各種資源文件複製到目標目錄中
        3. CocoaPods通過一個名為Pods.xcconfig的文件在編譯時設置所有的依賴和參數最常用的版本控制工具是什麼，能大概講講原理麼？
    * git
        * 發展於2005, Linus Torvalds開始
        * 主要記錄「檔案快照」
        * 常使用command:
            * git init
            * git add .
            * git commit -m ‘here is commit ‘
            * git branch
            * git rebase
            * git push/pull 
            * git checkout [hash value] /  ‘branch’
* 今年你最想掌握的一門技術是什麼？為什麼？目前已經做到了哪個程度？
    * Unit test
        * 缺點：短期來看會增加開發時程
        * 優點：長期來看可以降低開發成本，因為程式架構隨時間異動，某些功能的增/減對於程式穩定性是未知，如果有unit test的導入會使測試成本下降，進而降低開發成本
        * 簡易的小測試單元
    * Design Pattern ：
        * 降低耦合、增加維護性與降低維護成本
        * Singleton
        * Delegation
        * Factory
    * POP：
        * 配合functional Programming & Value type 寫出好維護使用的專案
* 你一般是怎麼用 Instruments 的？
    * 檢測memory Leak
* 你一般是如何調試 Bug 的？
    1. print
    2. UI Graphic capture
    3. Break point
* 你在你的項目中用到了哪些設計模式？
    * singleton, delegation, MVC, Factory, Oberserve, strategy
* 如何實現單例，單例會有什麼弊端？
    * 宣告及調用方式：
￼
* iOS 是如何管理記憶體的？
    * reference type: ARC, Heap
        * class
        * closure
        * 當class/ closure被持有時Automatic Retain Counter即會+1，若使用weak 或 unwond 做屬性修飾，則不會
        * 當兩個class / closure互為持有時，會有retain cycle發生，即為Memory leak，當memory達上限時，會造成app的Crash
    * value type: Stack
        * struct
        * enum
