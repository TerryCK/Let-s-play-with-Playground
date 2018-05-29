import Foundation

protocol StackProtocol {
    associatedtype Element
    
    mutating func pop() -> Element?
    mutating func push(_ element: Element)
    var isEmpty: Bool { get }
    var count: Int { get }
    
}
struct Stack<Element>: StackProtocol {
   private var stack = Array<Element>()
    
    mutating func pop() -> Element? {
        return isEmpty ? nil : stack.removeLast()
    }
    
    mutating func push(_ element: Element) {
        stack.append(element)
    }
    
    var isEmpty: Bool { return stack.isEmpty }
    
    var count: Int { return stack.count }
    
}
// time: O(1)

var stack = Stack<Any>()
stack.count
stack.push("x")
stack.push(10)
stack.count

stack.pop()
stack.pop()
stack.pop()



