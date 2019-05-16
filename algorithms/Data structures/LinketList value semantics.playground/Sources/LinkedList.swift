import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        return head.flatMap(String.init(describing: )) ?? "Empty list"
    }
}


extension LinkedList {
    public mutating func push(_ newElement: Value) {
        head = Node(value: newElement, next: head)
        if tail == nil { tail = head }
    }
    
    
    public mutating func append(_ newElement: Value) {
        guard !isEmpty else {
            push(newElement)
            return
        }
        tail?.next = Node(value: newElement)
        tail = tail?.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil, currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
 
    
     @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard !isEmpty else { return nil }
        guard head?.next != nil else { return pop() }
        
        var prev = head
        var current = head
        while let next = current?.next {
            prev = current
            current = next
        }
        prev?.next = nil
        tail = prev
        return current?.value
    }
    
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
         node.next = node.next?.next
        }
        return node.next?.value
    }
    
    private mutating func copy() -> LinkedList {
       print("\n deep copy")
        guard var oldNode = head else { return self }
        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
        return self
    }
    
    @discardableResult
    public mutating func insert(_ newElement: Value, after node: Node<Value>) -> Node<Value> {
        guard !isKnownUniquelyReferenced(&head), tail !== node else {
            append(newElement)
            return tail!
        }
        self = copy()
        node.next = Node(value: newElement, next: node.next)
        return node.next!
    }
}


extension LinkedList: Collection {
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?): return left.next === right.next
            case (nil, nil): return true
            default: return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard  lhs != rhs else { return false }
            return sequence(first: lhs.node) { $0?.next }.contains { $0 === rhs.node }
        }
    }
    
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
    
 
}

