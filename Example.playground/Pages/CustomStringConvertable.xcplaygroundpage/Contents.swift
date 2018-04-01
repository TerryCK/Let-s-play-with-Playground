import Foundation

struct Point {
    let x: Int
    let y: Int
}


extension Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}
let point = Point(x: 2, y: 10)
print(point)


extension Point: CustomDebugStringConvertible {
    var debugDescription: String {
        return "debug: (\(x), \(y))"
    }
}
debugPrint(point)

