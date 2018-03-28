//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



class A {
    final var x = 10
    class var y: Int { return 10}
    enum EnumX {
        case x
    }
}

class C: A {
    
}
class B: A {
    private enum EnumX {
        case x
    }
    
}
//let b = B
B.y


let c = C()
c.x



enum Gender: Int {
    case male = 1  , fermale
    
}
let x = Gender(rawValue: 2)




protocol MyProtocol {
    
}

extension MyProtocol {
    static func staticFunc() -> String  {
        return "static"
    }
}


struct MyStruct:MyProtocol{
    
}

let myStruct = MyStruct.staticFunc()

