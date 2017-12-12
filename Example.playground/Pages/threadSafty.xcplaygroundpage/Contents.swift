 import Foundation
 
 var array = [1,2,3,4]
 
 // read the `array` to property `getArray`, to properties in the same heap momery address, not copy data form `array` to `getArray` right now.
 
 array
 address(of: array)
 
 
 array.append(10)
 // ---------------- after modified -----------------
 // here is new copy from `array` to `getArray` because `array` is modified, by line 13, COW (Copy On Write)
 
 array
 address(of: array)
 
 
 
 
 
 func sizeof<T> (_ : T) -> Int
 {
    return (MemoryLayout<T>.size)
 }
 
 func sizeof<T> (_ value : [T]) -> Int
 {
    return (MemoryLayout<T>.size * value.count)
 }
 
 func address(of o: UnsafeRawPointer) -> String {
    return unsafeBitCast(o, to: Int.self).toHexString
 }
 
 func addressHeap<T: AnyObject>(_ o: T) -> String {
    return unsafeBitCast(o, to: Int.self).toHexString
 }
 
 extension Int {
    var toHexString: String {
        return NSString(format: "%p", self) as String
    }
 }
 
