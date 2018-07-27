import Foundation

//        5
//       / \
//      3   6
//     /  \   \
//    2   4     7

// expection :
// target: 9 => ture
// target: 28 => false
// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/
class Node<T> {
    let leftNode: Node<T>?
    let rightNode: Node<T>?
    let value: T?
    
    init(left: Node<T>?, right: Node<T>?, value: T) {
        leftNode = left
        rightNode = right
        self.value = value
    }
}

let node2 = Node(left: nil, right: nil, value: 1)
let node4 = Node(left: nil, right: nil, value: 4)

let node7 = Node(left: nil, right: nil, value: 7)

let node3 = Node(left: node2, right: node4, value: 3)

let node6 = Node(left: nil, right: node7, value: 6)

let node5 = Node(left: node3, right: node6, value: 5)
let node1 = Node.init(left: nil, right: nil, value: 1)

class Solution {
    static func findTarget(_ root: Node<Int>? , _ k: Int) -> Bool {
        var temp = [Int: Int]()
        
        func findTarger2(_ node: Node<Int>? , _ k: Int) -> Bool {
            
            var result = false
            
            if let right = node?.rightNode {
                result = result || findTarger2(right, k)
            }
            
            if let left = node?.leftNode {
                result = result || findTarger2(left, k)
            }
            
            if let value = node?.value {
                result = result || temp[k - value] != nil
                temp[value] = value
            }
            return result
        }
        
        return findTarger2(root, k)
    }
}

Solution.findTarget(node5, 9) == true
Solution.findTarget(node5, 28) == false


Solution.findTarget(node1, 2) == false
