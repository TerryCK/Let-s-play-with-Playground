//: [Previous](@previous)

/*:
 #### `Strategy` design pattern
 - 概念：完成某項任務可以有不同種實現方式，這樣的概念我們稱為`strategy`
 - 使用時機：在一個`class`或`struct`中，有相同方法如使用不同的流程例如：同樣`attack`的方法使用不同的武器，只在不同的操作行為。
 - 使用的`class`/`struct`非直接調用方法而是透過調用符合`procotol`
 - 本範例會有：
 1. 傳統方式：在TradictionalAdventure中實作各種Attack方法
 2. `strategy`方式：使用不同武器展現不同的`策略`進行攻擊
 */


//: ### Tradictional way
class TradictionalAdventure {
    private let name: String
    
    init(adventureName: String) {
        name = adventureName
    }
    
    func attack() {
        print("The adventure \(name) excute normal attack")
    }
    
    func halberdAttack() {
        print("The adventure \(name) excute halberd waving attack")
    }
    
    func swordAttack() {
        print("The adventure \(name) excute sword waving attack")
    }
    
    func rushAttack() {
        print("The adventure \(name) excute slingshot archery attack")
    }
}



//: ### Strategy way

protocol Strategy {
    func attack() -> String
}

struct Adventure {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func attack(with strategy: Strategy?) {
        if let strategy = strategy {
            let way = strategy.attack()
            print("The adventure \(name) excute \(way) attack")
        } else {
            print("The adventure \(name) excute normal attack")
        }
    }
    
}

//: ### Strategy encapsulation & implement
struct SwordStrategy: Strategy {
    func attack() -> String {
        return "Sword waving"
    }
}

struct SlingshotStrategy: Strategy {
    func attack() -> String {
        return "Slingshot archery"
    }
}

struct HalberdStrategy: Strategy {
    func attack() -> String {
        return "Halberd waving"
    }
}

//: ##### 各種策略實體化
let halberdStrategy = HalberdStrategy()
let slingshotStrategy = SlingshotStrategy()
let swordStrategy = SwordStrategy()

//: ##### 冒險家實體化
let adventure = Adventure(name: "Terry")

//: ##### 冒險家使用不同策略進行攻擊
adventure.attack(with: swordStrategy)
adventure.attack(with: slingshotStrategy)
adventure.attack(with: halberdStrategy)


//: ###### 特別感謝 iOS 開發者 [陳董的這篇文章](https://ios.devdon.com/archives/199)
//: [Next](@next)
