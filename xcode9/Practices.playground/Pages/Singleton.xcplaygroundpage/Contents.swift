import Foundation

// Mark: struct Singleton


struct ASingleton {
    static let shared = ASingleton()
    private init() {
        
        print("create a singleton")
    }
    var aProperty: String = "aProperty in Struct"
}

struct NonSingleton {
    let name: String = "String"
    init() {
        print(" create a non singleton")
    }
}


for _ in 0...100 {
    let singleton = ASingleton.shared.aProperty // just created one
    let nonSingleton = NonSingleton()  /// create many of copies
}

