//: ## 工廠方法模式 (Factory Method Pattern)

//: - 工廠方法模式：通過選取相關的實例化方法來滿足組件的調用請求，而調用組件不需要了解具體的實例化細節。
//: - 什麼時候可以用：當存在多個類共同實現一個協議活著共同繼承一個基礎類的時候，可以使用「工廠方法模式」。


//: #### 定義產品分類
enum BoxType {
    case smallBox
    case bigBox
    case largeBox
}


//: #### 工廠依據產品種類走不同產線(只會存在一個工廠)
class ProductFactory {
    static let shared = ProductFactory()
    private init(){}
    
    func createProduct(biscuitCount:Int) -> Product {
        switch biscuitCount {
        case 0...4:
            return SmallProduct(biscuitCount: biscuitCount)
        case 6...10:
            return BigProduct(biscuitCount: biscuitCount)
        default:
            return LargeProduct(biscuitCount: biscuitCount)
        }
    }
    
}

protocol ProductProtocol {
    init(name: String, box: BoxType, biscuitCount: Int)
    
}

//: #### 定義產品類
class Product {
    var name:String
    var box:BoxType
    var price:Float
    
    init(name: String, box: BoxType, biscuitCount: Int) {
        let price = Float(biscuitCount) * 5.0
        self.name = name
        self.box = box
        self.price = price
    }
}


class SmallProduct: Product {
    init(biscuitCount: Int) {
        super.init(name: "Small Product", box: .smallBox, biscuitCount: biscuitCount)
        
    }
}

class BigProduct: Product {
    init(biscuitCount:Int) {
        super.init(name: "Big Product", box: .bigBox, biscuitCount: biscuitCount)
        
    }
}

class LargeProduct:Product {
    init(biscuitCount:Int) {
        super.init(name: "Large Product", box: .largeBox, biscuitCount: biscuitCount)
        
    }
}



let orderList = [1,3,5,7,9,12,15,18]

let factory = ProductFactory.shared

var products = [Product]()

for order in orderList {
    let product = factory.createProduct(biscuitCount: order)
    products.append(product)
}

for product in products {
    print(product.name + " - Price: " + "\(product.price)")
}
