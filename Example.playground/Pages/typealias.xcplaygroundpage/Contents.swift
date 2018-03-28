//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
typealias ATuple<T> = (T,T,T)

func aFunc(datas: ATuple<Int>) {
    print(datas.0)
    print(datas.1)
    print(datas.2)
}

let atuple: ATuple<Int> = (5, 2, 1)

aFunc(datas: atuple)
let x = type(of: Int.self)

