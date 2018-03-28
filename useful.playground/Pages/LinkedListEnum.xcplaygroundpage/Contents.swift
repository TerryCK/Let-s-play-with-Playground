
indirect enum LinkedList<T> {
    case node(LinkedList<T>, T?)
    case empty(T?)
    
    var reversedOrder: [T] {
        return LinkedList.revesed(nextNode: self).dropLast().dropFirst().flatMap{ $0 }
    }
    
    static private func revesed<T>(nextNode: LinkedList<T>) -> [T?] {
        switch nextNode {
        case let .node(node, value): return [value] + revesed(nextNode: node)
        case let .empty(value)     : return [value]
        }
    }
}

extension Array {
    func generatorLinkedList(node: LinkedList<Element> = .empty(nil), index: Int = 0) -> LinkedList<Element> {
        return count == index ? LinkedList.node(node, nil) : generatorLinkedList(node: LinkedList.node(node, self[index]), index: index + 1)
    }
}

let intArray = Array(0...5).generatorLinkedList().reversedOrder
let StringArray = Array("Terry").generatorLinkedList().reversedOrder

