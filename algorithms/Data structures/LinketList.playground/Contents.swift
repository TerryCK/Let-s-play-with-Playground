
// Single direction Linked List

import Foundation


final class Node<T> {
    weak var previous: Node?
    var next: Node?
    var element: T?
    
    init(next: Node?, previous: Node? = nil, element: T?) {
        self.next = next
        self.element = element
        self.previous = previous
    }
}

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var first: Node<T>? { return head }
    
    var last: Node<T>? {  return tail }
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ newElement: T) {
        let newNode = Node(next: nil, element: newElement)
        if let tailNode = tail {
            newNode.previous = tailNode
        }
    }
    
    
    public func append(value: String) {
        // 1
        let newNode = Node(value: value, element: <#T?#>)
        // 2
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
            // 3
        else {
            head = newNode
        }
        // 4
        tail = newNode
    }

    init(elements: [T]) {
        var array = elements
        var next: Node<T>? = nil , previous: Node<T>? = nil
        while let last = array.popLast() {
            next = Node(next: next, previous: previous, element: last)
        }
        
        head = next
    }
    
    func forEach() {
        var node = head
        print(node!.element)
        while let next = node?.next {
            node = next
            print(next.element)
        }
    }
}

let linkedList = LinkedList(elements: Array(1...3))
linkedList.first

linkedList.forEach()

linkedList.append(5)

linkedList.forEach()














