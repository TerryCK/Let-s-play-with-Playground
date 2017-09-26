protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Stack<Item>: Container {
    var items = [Item]()
//    typealias Item = Int
    
    mutating func push(_ itme: Item) {
        items.append(itme)
    }
    
    mutating func pop() -> Item {
        return items.removeLast()
    }
    
    mutating func append(_ item: Item) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Item {
        return items[i]
    }
}

var stack = Stack<Int>()
stack.push(123)
stack.pop()






protocol MyIteratorProtocol {
    associatedtype Element
    func next() -> Self.Element?
}


struct MyIterator: MyIteratorProtocol {
    typealias Element = Bool
    func next() -> Bool? {
        return true
    }
}

import Foundation
let mt = MyIterator()



//
//while let flag = mt.next(), flag {
//    Thread.sleep(forTimeInterval: 1)
//    print(Date())
//}


protocol GetDefaultAssociatedType {
    associatedtype SomeType = Double
}


struct SomeStruct: GetDefaultAssociatedType {
    func multiply(x: SomeType) {
        print(x)
    }
    
}

func lessThan<T: Comparable>(x: T, y: T) -> Bool {
    return x < y
}
// is equivalent to
func lessThan2<T>(x:T, y:T) -> Bool where T: Comparable {
    return x < y
}


func someFunc<T,U>(s1: T, s2: U) where T:Sequence, U: Sequence ,T.Iterator.Element == U.Iterator.Element {
    
}






