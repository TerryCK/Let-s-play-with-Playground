//: Playground - noun: a place where people can play

import UIKit
import Foundation

MemoryLayout<Int>.size
MemoryLayout<String>.size
MemoryLayout<Double>.size

func memoize<T: Hashable, U>( body: @escaping (T) -> U ) -> (T) -> U  {
    var memo = Dictionary<T, U>()
    return { x in
        if let q = memo[x] { return q }
        let r = body(x)
        memo[x] = r
        return r
    }
}

func sizeof<T> (_ : T) -> Int { return (MemoryLayout<T>.size) }

func sizeof<T> (_ value : [T]) -> Int { return (MemoryLayout<T>.size * value.count) }

func address(of o: UnsafeRawPointer) -> String { return Int(bitPattern: o).toHexString }

func addressHeap<T: AnyObject>(_ o: T) -> String { return unsafeBitCast(o, to: Int.self).toHexString }

extension Int {
    var toHexString: String { return String(format: "%p", self) }
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



struct BatteryStationRecord: Codable {
    let id: Int, checkinCount: UInt8, checkinDay: Date?
}
sizeof(BatteryStationRecord(id: 0, checkinCount: 0, checkinDay: nil))


sizeof(Optional(Date()))
sizeof("das")
sizeof(Optional(UInt8(1)))
sizeof(10)
UInt8.max
33000/25
