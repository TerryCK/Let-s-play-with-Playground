import Foundation

protocol Countable {
    var myCount: Int { get }
}


extension Array: Countable where Element: Countable {
    var myCount: Int {
        return reduce(0) { $0 + $1.myCount }
    }
}

struct Person: Countable {
    let name: String
    var myCount: Int { return name.count }
}


[Person(name: "Terry"), Person(name: "Tony")].myCount



