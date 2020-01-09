
// Single direction Linked List

import Foundation

public func example(of id: String, closure: () -> Void) {
    print("---\(id)---")
    closure()
    print("\n")
}


example(of: "Example of creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    node1.next = node2
    node2.next = node3
    
    print(node1)
}





example(of: "Example of creating and linking nodes") {
    let node1 = Node(value: 1)
    var linkedList = LinkedList<Int>()
    linkedList.head = node1
    print(linkedList)
}


example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print(list)
}



example(of: "append") {
    var list = LinkedList<Int>()
    
    Array(1...3).forEach {
        list.append(4-$0)
    }
    
    print(list)
}


example(of: "Example of inserting at a particular index") {
    var list = LinkedList<Int>()
    Array(1...3).forEach { list.append($0) }
    
    print("Before inserting: \(list)")
    
    var middleNode = list.node(at: 1)!
    
    (0...3).forEach { _ in
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting:  \(list)")
}

example(of: "Example of inserting at a particular index") {
    var list = LinkedList<Int>()
    Array(1...3).forEach { list.append($0) }
    
    print("Before popping list: \(list)")
    
    let poppedValue = list.pop()
    print("After popping list:  \(list)")
    
    print("Popped value: \(String(describing: poppedValue))")
}

example(of: "removing the last node") {
    var list = LinkedList<Int>()
    Array(1...3).forEach { list.append($0) }
    
    print("Before removing list: \(list)")
    
    let poppedValue = list.removeLast()
    print("After removing list:  \(list)")
    
    print("Popped value: \(poppedValue)")
}


example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    Array(1...3).forEach { list.append($0) }
    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("After removing at particular index:  \(list)")
    print("Removed value: \(removedValue)")
}

example(of: "using collection") {
    var list = LinkedList<Int>()
    
    (0...9).forEach { list.append($0) }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elemets: \(Array(list.suffix(3)))")
    
    print("Sum of all values: \(list.reduce(0, +))")
}
 








example(of: "COW") {
    var list = LinkedList<Int>()
    
    list.push(10)
    

    
    list.insert(20, after: list.node(at: 0)!)
    
    print("List A: \(list)\nlist B: \(listB)")
}
