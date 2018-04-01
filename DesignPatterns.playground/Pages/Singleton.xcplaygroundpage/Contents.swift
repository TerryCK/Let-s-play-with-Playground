
//: ## 單例模式（Singleton Pattern）
//: * 解決什麼問題：降低記憶體資源使用的問題，例如下載URLSession 只需要一個，UIWindow只需要一個
//: 使用時機：物件只需存在一個的時候，如: AppDelegate, UserDefault
//: * 優點：只會存在一個物件，降低佔用記憶體資源
//: * 缺點：佔有一個記憶體資源，無法釋放直到App kill。


class SingletonClass {
    static let shared = SingletonClass()
    private init() { }
    func someMethod() -> String { return "someMethod" }
    let constantProperty = "constantProperty"
    var variableProperty = "variableProperty"
}


let singletonClass = SingletonClass.shared
singletonClass.constantProperty
singletonClass.variableProperty
singletonClass.someMethod()




//: 測試是否單例


// Mark: struct Singleton


struct ASingleton {
    static let shared = ASingleton()
    private init() {
        
        print("create a Asingleton")
    }
    var aProperty: String = "create a Asingleton"
    mutating func method(a: String) {
        aProperty = a
    }
}

struct NonSingleton {
    let name: String = "String"
    init() {
        print(" create a non singleton")
    }
}



for _ in 0...100 {
    var singleton = ASingleton.shared // just created one
    singleton.method(a: "x")
//    let nonSingleton = NonSingleton()  /// create many of copies
}



