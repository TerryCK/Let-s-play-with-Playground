//: ## 裝飾者模式（Decorator Pattern）
//:  裝飾器模式可以選擇性的修改對象的行為，可以使用的場景很多，尤其是在無法修改類的時候。
//:  在擴展方面裝飾者模式比生成子類更靈活。
//:  何時應該避免使用：如果可以修改想要修改的對象的類，這時候往往直接修改更簡單。
//:  * 陷阱：最容易碰到的陷阱就是直接使用Swift的Extension來裝飾對象。
//:  * 裝飾器的一個主要特徵是「選擇性」的應用到單個對象上，而Extension則是修改所有某個類型的對象。


import Foundation

var str = "Hello, playground"

