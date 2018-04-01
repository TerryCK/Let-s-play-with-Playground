import Foundation
// Source: http://www.lintcode.com/en/problem/reverse-order-storage/
// Question: Given 1 -> 2 -> 3 -> null, return [3,2,1].

class LinkedListNode<T> {
    private(set) var value: T
    var nextNode: LinkedListNode?
    init(value: T, nextNode: LinkedListNode? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}

extension Collection {
    func generatorLinkList(inital: inout LinkedListNode<Element>) {
        reduce(into: inital) {
            $0.nextNode = LinkedListNode(value: $1)
            $0 = $0.nextNode!
        }
    }
}

var firstNodeWithIntType = LinkedListNode(value: 0)
var firstNodeWithCharacter = LinkedListNode(value: Character("a"))

(1...10).generatorLinkList(inital: &firstNodeWithIntType)
"ABCDEF".generatorLinkList(inital: &firstNodeWithCharacter)

func reversed<T>(node: LinkedListNode<T>) -> [T] {
    switch node.nextNode {
    case let nextNode?: return reversed(node: nextNode) + [node.value]
    case nil          : return [node.value]
    }
}

firstNodeWithIntType.nextNode.map(reversed)
reversed(node: firstNodeWithCharacter).dropLast()





