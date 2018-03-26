protocol AProtocol {
    
}

extension AProtocol where Self == AStruct {
    var property: Double {
        get { return self.aStoreProperty}
        set { self.aStoreProperty  = newValue}
    }
}

struct AStruct: AProtocol {
    var aStoreProperty: Double
}

var aStruct = AStruct(aStoreProperty: Double.infinity)

aStruct.property = 10

let x = aStruct.property

print(x)

private protocol XProtocol {
     var property: Int { get }
}








let weather: String? = "today is a sun day"

//func test<T>(str: T?) -> T.Type? {
//    switch str {
//    case let today?         : return type(of: today)
//    case .none              : return nil
//    }
//}

//let type = test(str: weather)
type(of: 10)
func test<T, U>(arg: T, metaTypeX: U.Type) -> U {
    
    return arg as? metaTypeX
}







