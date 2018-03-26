import UIKit
import Foundation
//Playground to test static dispatch in protocol extensions.

protocol Fighter{
    func fight() //Requirement method
//    func punch() //Requirement. Uncomment to see changes
}

extension Fighter {
    //Requirement common implementation
    func fight() { self.punch() }
    
    //Static method (it is not defined in the protocol)
    func punch() { print("Fighter punch") }
}

protocol MagicalFighter : Fighter {
    func castSpell() //Requirement
}

extension MagicalFighter {
    //Requirement common implementation
    func castSpell() { print("MagicalFighter casted a spell") }
    
    //Static
    func punch() { self.castSpell() }
    
    //Requirement. Uncomment to see changes
//    func fight() { self.punch() }
    
}

struct Hero : MagicalFighter {
    func castSpell() {
        print("Hero casted a special spell")
    }
}

let gordo = Hero()
gordo.fight()


protocol Terryable {
    func staticFunc() -> String
}

extension Terryable {
    func staticFunc() -> String { return "i'm terry in terryable" }
    
    static func withPrefixStaticFunc() -> String { return "withPrefixStaticFunc" }
}

struct Person : Terryable {
    static func withPrefixStaticFunc() -> String { return "withPrefixStaticFunc" }
    func staticFunc() -> String { return "i'm terry in terryable" }
}


let terry = Person()
terry.staticFunc()
let person = Person.self

person.withPrefixStaticFunc()






enum TestCaseless {
    static func test() -> String { return "created enum" }
    case myMoon(moon: String)
    case myName(name: String)
}

let testcaseless = TestCaseless.myMoon(moon: "gggg")

switch testcaseless {
case let .myMoon(moon):
    print(moon)
case .myName:
    
    
    print("y")
}



