
import Foundation
enum MyBool {
    case myTrue, myFalse
}

extension MyBool: ExpressibleByBooleanLiteral {
    typealias BooleanLiteralType = Bool
    
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}


let myBool: MyBool = true

print(myBool)


class Person: ExpressibleByStringLiteral {
    
    
    typealias StringLiteralType = String
    typealias UnicodeScalarLiteralType = String
    
    let name: String
    
    init(name value: String) {
        self.name = value
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: Person.ExtendedGraphemeClusterLiteralType) {
        self.init(name: value)
    }
    required convenience init(stringLiteral value: Person.StringLiteralType) {
        self.init(name: value)
    }
    required convenience init(unicodeScalarLiteral value: Person.UnicodeScalarLiteralType) {
        self.init(name: value)
    }
    
}

let person: Person = "Peter"

print(person.name)



