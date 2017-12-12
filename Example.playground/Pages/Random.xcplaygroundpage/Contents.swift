import GameKit
import PlaygroundSupport

protocol Arbitrary {
    static func arbitrary() -> Self
}

extension Int: Arbitrary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}

func tabulate<T>(times: Int, transform: (Int) -> T) -> [T] {
    return (0..<times).map(transform)
}

extension Int {
    static func random(from: Int, to: Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

extension Character: Arbitrary {
    static func arbitrary() -> Character {
        return Character(UnicodeScalar(Int.random(from: 65, to: 90)) ?? "0")
    }
}

extension String: Arbitrary {
    static func arbitrary() -> String {
        let randomLength = Int.random(from: 0, to: 40)
        let randomCharacters = tabulate(times: randomLength) { _ in
             Character.arbitrary()
        }
        return String(randomCharacters)
    }
}




String.arbitrary()

typealias MyElement = (String,  String)

let transform = { (index: Int, element: String) -> MyElement in
    return MyElement(String(index) , element)
}

/// test
let arrays = ["A","B"].enumerated().map(transform)



