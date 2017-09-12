//import UIKit
//let dic = [1:"a",2: "b",3: "c",4: "d",5: "e"]
//
//let array2 = Array(repeating: "gg", count: 5)
//
//
//for (key, value) in array2.enumerated() {
//    print(key, value)
//}
//
//for (key, value) in dic {
//    print(key, value)
//}
////why  dic is non-sequence?
////dic not define unordered with iterator
//
//
////use variadic parameters
//
//func sum(_ numbers: Int..., test: String? = nil) -> Int {
//    return numbers.reduce(0, +)
//}
//
//let array = array2.reduce("") {
//    $0 + $1
//}
//
//
//print(array)
//
//
//
//

struct TestStruct {
    var function: (Double, Double) -> (Double)
    var y: Double
    
    
}

TestStruct(function: {$0 + $1}, y: 1.1)





