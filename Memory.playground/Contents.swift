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



MemoryLayout<Decimal>.size
MemoryLayout<Double>.size



var originArray = [1,2,3,4]
var copy = originArray
address(of: originArray)
address(of: copy)
originArray.append(1)
copy.append(1)
address(of: copy)
address(of: originArray)
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


class MyClass {
    
}

let myClass = MyClass()
let x = (1,myClass,2)
sizeof(myClass)
sizeof(x)
//dump(myClass)

struct MyStruct {
    var x: UInt8 = 1
    var z: UInt8 = 1
    var y: Double = 1
}

let myStruct = MyStruct()
sizeof(myStruct)


class TestPrivateClass: UIViewController, AccessbilityID {
    lazy var button: UIButton! = {
        let button = UIButton(type: .system)
        button.titleLabel?.text = "test"
        return button
    }()
    
    
}

protocol AccessbilityID {
    func setup()
}

extension AccessbilityID {
    func setup() {
        let mirror = Mirror(reflecting: self)
        for case let (key?, button as UIButton) in mirror.children {
            button.accessibilityIdentifier = " \(mirror.subjectType)_\(String(describing: key))"
        }
    }
}




let test = TestPrivateClass()
test.button
test.setup()



test.button.accessibilityIdentifier

