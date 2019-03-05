//: Playground - noun: a place where people can play

import UIKit
import Foundation

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






func sizeof<T> (_ : T) -> Int
{
    return (MemoryLayout<T>.size)
}

func sizeof<T> (_ value : [T]) -> Int
{
    return (MemoryLayout<T>.size * value.count)
}

func address(of o: UnsafeRawPointer) -> String {
    
    return Int(bitPattern: o).toHexString
    //    return unsafeBitCast(o, to: Int.self).toHexString
}

func addressHeap<T: AnyObject>(_ o: T) -> String {
    return unsafeBitCast(o, to: Int.self).toHexString
}

extension Int {
    var toHexString: String {
        return NSString(format: "%p", self) as String
    }
}



var array = [1,2,3,4]

// read the `array` to property `getArray`, to properties in the same heap momery address, not copy data form `array` to `getArray` right now.

array
address(of: array)


array.append(10)
// ---------------- after modified -----------------
// here is new copy from `array` to `getArray` because `array` is modified, by line 13, COW (Copy On Write)

array
address(of: array)



