import Foundation

protocol QueueProtocol {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var count: Int { get }
}


struct Queue<Element>: QueueProtocol {
    private var queue = [Element]()
    
    mutating func enqueue(_ element: Element) {
        queue.insert(element, at: 0)
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : queue.removeLast()
    }
    
    var isEmpty: Bool { return queue.isEmpty }
    var count: Int { return queue.count }
}

var queue = Queue<Any>()
queue.enqueue(123)
queue.enqueue(234)
queue.count
queue.dequeue()
queue.dequeue()
queue.dequeue()


