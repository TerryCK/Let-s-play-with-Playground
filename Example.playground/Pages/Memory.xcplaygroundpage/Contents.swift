//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Hello, playground"
MemoryLayout<Int>.size
MemoryLayout<String>.size
MemoryLayout<Double>.size

typealias IntFunction = (Int) -> Int

func funcBuild(_ f: @escaping IntFunction, _ g: @escaping IntFunction) -> IntFunction {
    return {  f(g($0)) }
}

let f1 = funcBuild({$0 + 2}, {$0 + 3})
f1(0) // 得到 5
let f2 = funcBuild({$0 * 2}, {$0 * 5})
f2(1) // 得到 10”

func funcBuild<T, U, V>(_ f: @escaping (T) -> U, _ g: @escaping (V) -> T) -> (V) -> U {
    return { f(g($0))}
}

let f3 = funcBuild({ "No." + String($0) }, {$0 * 2})
f3(23)


func memoize<T: Hashable, U>( body: @escaping (T) -> U ) -> (T) -> U  {
    var memo = Dictionary<T, U>()
    return { x in
        if let q = memo[x] { return q }
        let r = body(x)
        memo[x] = r
        return r
    }
}



