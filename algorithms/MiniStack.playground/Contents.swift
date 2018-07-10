//: track min number of stack by O(1)

import Foundation

protocol StackProtocol {
    associatedtype Element
    mutating func pop() -> Element
    mutating func push(_ element: Element)
}

struct Stack<Element>: StackProtocol {
    private var array =  Array<Element>()
    
    mutating func pop() -> Element {
        return array.removeLast()
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    var top: Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
}


struct MinStack<Element: Comparable>: StackProtocol {
    
    private var miniStack = Stack<Element>()
    private var stack = Stack<Element>()
    
    mutating func pop() -> Element {
        miniStack.pop()
        return stack.pop()
    }
    
    mutating  func push(_ element: Element) {
        if miniStack.isEmpty {
            miniStack.push(element)
        } else if let top = miniStack.top {
            miniStack.push( top > element ? element : top)
        }
        stack.push(element)
    }
    
    var min: Element? {
        return miniStack.top
    }
}
var miniStack = MinStack<Int>()

miniStack.push(10)
miniStack.min
miniStack.push(5)
miniStack.min
miniStack.push(1)
miniStack.min



miniStack.pop()
miniStack.min
miniStack.pop()
miniStack.min


