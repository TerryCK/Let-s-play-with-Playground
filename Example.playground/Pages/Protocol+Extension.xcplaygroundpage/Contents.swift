//// functonal programming
//// an optional Int
//let x: Int? = 10
//
//// normally func
//func add1(x: Int, _ y: Int) -> Int {
//    return x + y
//}
//
//
//typealias Transform<T> = (T) -> T
//
//// Curring func, the function is the same with add1 and get func return
//
////柯理化
//func add2(x: Int) -> Transform<Int> {
//    return { y in x + y }
//}
//
//// creat a func like Object
//
//let aFunction = add2(x: 10)
//
//// usage
//aFunction(10)
//
//
////x is functor, map is applicative, aFunction is
//let y = x.map(aFunction)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//func pureFunction(x: Int) {
//    print(x)
//}
//
//var jj = 10
//func nonPureFunction(x: Int) {
//        jj = x   // side effect 處理到函式外的參數
//    print(x)
//}
//
//
//
//
//
//
//
//
////let increment = { (element: Int, f: (Int) -> (Int)) -> Int in
////    return f(element)
////}
////let function: (Int) -> (Int) = { (x: Int) in
////    return x + 10
////}
////
////typealias IntFunction = (Int) -> Int
////
////func map(_ f: @escaping IntFunction, _ g: @escaping IntFunction) -> IntFunction {
////    return { x in f(g(x)) }
////}
////
////let foo = map({ $0 + 2 }, { $0 + 3 })
////foo(10)
////
////struct Parser<Token, Result> {}
//////func pure<Token, A, B>(f: )
////infix operator <*>
////@discardableResult func <*><Token,A,B>(l: Parser<Token, (A) -> B>, r: Parser<Token, A>) -> Parser<Token, B> {
////
////}
////Double(String(format:"%.1f", self / 1000)) ?? 0
//
//struct People {
//    let name: String
//    var color: String
//}
//
//var a = People(name: "Bob" , color: "black")
//var b = People(name: "Terro", color: "white")
//let array = [a,b]
//
//import Foundation
//
//
//
//    // MARK: - put the task to thread-pool and get the callback Bool
//
//    let groupQueue = DispatchGroup()
//    typealias Completed = () -> Void
//    func calculateRoute(complete: @escaping Completed ) {
//
//
//        groupQueue.enter()
//        DispatchQueue.global().async {
//            print("doing somthing with async queue")
//
//            // Create request
//                groupQueue.leave()
//            }
//        }
//
//        groupQueue.notify(queue: DispatchQueue.main) {
//            Completed()
//        }
//
//


import UIKit


protocol SomeP {}
struct Foo: SomeP { }
class Bar: SomeP { }

// Element是SomeP型別操作
extension Array where Element == SomeP { func m1() {} }


// Element符合SomeP型別操作
extension Array where Element: SomeP { func m2() {} }


let arr1 : [SomeP] = [Foo(), Bar()]
// Element是SomeP型別操作
arr1.m1()
arr1.m2()


// Element符合SomeP型別操作
let arr2: [Foo] = []
arr2.m1()
arr2.m2()

let arr3: [Bar] = []
arr3.m1()
arr3.m2()

let arr4 = arr3.map { $0 as SomeP }
arr4.m1()
arr4.m2()






