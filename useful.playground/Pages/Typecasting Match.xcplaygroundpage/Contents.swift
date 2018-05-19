import UIKit

class A { }
class B: A { }
class C: B { }

let a = B()

func finder(destination: A?){
    print(destination)
    switch destination {
    case let c as C:
        print("\(c)) C")
    case let b as B:
        print("\(b) B")
    default: break
    }
}


finder(destination: a)

class Test {
    var count: Int = 0 {
        didSet {
            print(count)
        }
    }
}
var x: [Int]?  = [0]

print(x?.count)

let test : Test? = Test()
test?.count = (x?.count)!
