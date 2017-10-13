# iOS 面試問題練習：
## Outline

1. [Talk](#talk)
2. [Tool](#tool)
3. [iOS Skills](#ios-skills)
## Talk

* 最近這兩天你有學到什麼知識/技能麼？
    * Protocol-Oriented Programming
    * Extension & protocol
    * 實作在「GoStation」專案的in-App Purchase 中
	
* 最近有做過比較酷或者比較有挑戰的項目麼？
    * 串接全台灣共享單車的即時資料 - 整合不同API為單一窗口使用
    * 實作Gogoro全台充電站地圖，並客製自己app中打卡功能，透過演算法merge data model 
* 最近看過的書/文章有哪些？
    * Hacking with Swift “Pro Swift” 主要是POP章節
    * 大腦解密手冊 - 學習學習再學習
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
    * 有，相關開源專案請參考：[https://goo.gl/n6woJX](https://goo.gl/n6woJX)
* 你最近遇到過的一個技術挑戰是什麼？怎麼解決的？
<!--思考中-->
## Tool
* 開發常用的工具有哪些？
    * git, cocoapods, xcode, json reader, source tree
* 熟悉 CocoaPods 麼？能大概講一下工作原理嗎？
    * cocoapods 主要是依據該套件的 git repository 以及指定的版本來控管套件
    * 公開的Pods： 從CocoaPods的server讀取並依據Podspec的內容安裝套件
    * 私密Pods：的則需要指定路徑到該Podspec的所在位置
        * CocoaPods原理:
        1. Pods項目最終會編譯成一個名為libPods.a的文件,主項目只需要依賴這個.a文件即可
        2. 對於資源文件, CocoaPods提供了一個名為Pods-resources.sh的bash腳本,該腳本在每次項目編譯的時候都會執行,將第三方的各種資源文件複製到目標目錄中
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
            
## iOS Skills
* 今年你最想掌握的一門技術是什麼？為什麼？目前已經做到了哪個程度？
    * Test Driven Development(TDD)
        * 缺點：短期來看會增加開發時程
        * 優點：長期來看可以降低開發成本，因為程式架構隨時間異動，某些功能的增/減對於程式穩定性是未知，如果有unit test的導入會使測試成本下降，進而降低開發成本
        * 目前進度：簡易的小測試單元
    * Design Pattern ：
        * 降低耦合、增加維護性與降低維護成本
            * Singleton
            * Delegation
            * Factory
            * Strategy
    * POP：
        * 配合functional Programming & Value type

* 你一般是怎麼用 Instruments 的？
    * 檢測 memory Leak
* 你一般是如何調試 Bug 的？
    1. print: 在console —  印出預期結果判斷
    2. UI Graphic capture  —  抓UI圖層上的Bug
    3. Break point搭配lldb(抓執行序與參數)
* 你在你的項目中用到了哪些設計模式？
    * singleton, delegation, MVC, Factory, Observe, strategy
* 如何實現單例，單例會有什麼弊端？
    * 宣告及調用方式：
    * !["Go交換站"](/screenshots/Singleton.png)
	 * 弊端：會持續佔有記憶體資源￼
* iOS 是如何管理記憶體的？
    * reference type: 記憶體管理方式— Heap, ARC
        * class
        * closure
        * 當class/ closure被持有時Automatic Retain Counter即會+1，若使用weak 或 unwond 做前綴修飾，則Automatic retain counter 不會+1
        * 關於 strong/weak 為兩個不同的retain count:
        	* 有兩物件互相引用，A物件使用strong count, B物件使用weak count當strong count為0且weak count不為零時，B物件會與A物件同時被系統回收(deinitialize)，而回收時間點再runtime訪問完AB物件後進行回收，當尚未訪問B物件時，weak物件仍佔據記憶體資源造成冗餘的浪費。
        	* Swift 4中，介紹了`side tables`的新概念，`side tables`是個可選值(optional)，用來儲存`object`的額外資訊，新的`object`可以有或沒有`side tables`，如果`object`不需要`side tables`就不需要浪費記憶體。[參考連結](https://goo.gl/UcQj3X)。
        	*
        * 兩個class / closure互為持有時，會有retain cycle發生，即為Memory leak，當memory使用達上限前，會先觸發memory warning依照使用者設計記憶體釋放流程釋放，若記憶體不足，則會造成app的Crash，記憶體崩潰點依裝置不同而有差異：[ios app maximum memory budget
](https://goo.gl/g4vHXQ)
    * value type: 記憶體管理方式 — Stack
        * struct
        * enum
* Swift的程式設計導向有OOP, POP及FP其主要設計的原則為：
	1. 單一職責 - 每個class, function 只作一件事情
	2. 避免重複作相同或相似程式片段
	3. 好的組合優於繼承
* 什麼是Functional Programming(FP)? [1](#1.objc.io-functional-Swift)
	 * 精神：FP只專注在執行結果，不在意執行過程，func / struct 視為一致。
	 * 解決痛點：避免使用狀態與可變對象(mutable)，有效降低程式複雜度的方式之一
    * Function是first class citizen(一等公民)，可以與class一樣的操作如下：
   		 * Function 可作為參數傳入function(high-Order function) 
    	 * Function 可以作為回傳值
    * Swift 在Collection內建有 map, flatMap, reduce, forEach, filter等高階函數可使用
    * 需了解`throw`, `rethrow`, `@escaping`等關鍵字
    * 可搭配`typealias`來使如`() -> ()`類的程式碼變得易閱讀。
    	* `typealias FunctionType = () -> ()` 
* 什麼是Objective-Oriented Programming(OOP)?
    * 具有：抽象、封裝、多型、`繼承` 等特性。 
    * 使用上述特性作為程式開發基礎架構。
    * Cocoa Touch是由OOP建構，如UIVew, UIViewController 等等...
* 什麼是Protocol-Oriented Programming(POP)?
    * 具有：抽象、封裝、多型(態)、`合成`等特性
    * 不是取代OOP，與OOP搭配使用，用來新增功能，減少Controller的工作負擔，增加維護性
    * 是Apple 官方推薦的開發方式
    * 搭配Value Type的only owner與Functional Programming
        * 高可測試性
        * 降低物件相互依賴
        * 強不變性(Strong immutable)
        * 以小模組功能作為開發基礎，透過合成function/protocol來實現整體功能。
* 對於多執序有什麼看法？
    * NSOperations是一種類的封裝
    * pthread
    * Grand Central Dispatch(GCD) —  基礎是C語言的API 
    * 更新UI相關任務只可以在main queue裡執行
    * 什麼是同步(Synchronous)與非同步(Asynchronous )？
        * 非同步：觸發非同步Block時，不考慮執行完與否，繼續執行block之後的程式
        * 同步：觸發同步Block時，會等到block執行完，才繼續往後執行，使用上尚未使用。
            * 如果再main Queue使用同步時，會造成UI凍結而影響UX
    * 什麼是Concurrent / Serial Queue?
        * Serial 串列執行序： CPU時間資源給queue執行完整個block，可以假設整個CPU時間屬於此block
        * Concurrent 並發執行序: 將CPU時間碎片化後分在某一小時段分給Block執行，不能預設整個CPU時間為此block 
            * 注意情境：例如兩個不同 async - Concurrent Queue，同時讀寫相同Property，會造成資料錯亂。
    * 需要考慮有線程安全(Thread Safety)：
        1. Deadlock — 兩個線程互相等待彼此存取資源釋放造成線程死鎖無法執行(凍結)。
        2. Priority inversion — 優先權反轉，造成低優先線程較高優先線程優先執行。
            1. Starving Thread: 飢餓線程，當高優先權線程與中優先權線程數量遠多於低優先權線程時，低優先線程很難獲得存取的資源，此稱為線程飢餓。
                * 線程飢餓發生不代表會發生Deadlock情況，因為高優先線程會被執行完畢
                * Deadlock與Starving Thread: 兩者發生共同原因是線程等不到cpu的執行時間資源
        3. Mutually exclusive( don’t write and read at same time)
* ViewController的 life cycle
    1. 建構到顯示：init -> loadView -> viewDidLoad -> viewWillAppear -> viewDidAppear 
    2. 消失到移除：viewWillDisappear -> viewDidDisappear -> dealloc 
* App lift cycle
    1. application:willFinishLaunchingWithOptions:
    2. application:didFinishLaunchingWithOptions:
    3. applicationDidBecomeActive:
    4. applicationWillResignActive:
    5. applicationDidEnterBackground:
    6. applicationWillEnterForeground:
    7. applicationWillTerminate: 
* 持續更新


## 更新歷史

	2017/10/10 Add Swift4 side table, modify memory manager details
	2017/10/3  First Release

## 文獻
1.Objc.io functional Swift