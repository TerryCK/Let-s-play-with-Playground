import Foundation
import XCTest
//        5
//       / \
//      3   6
//     /  \   \
//    2   4     7

// expection :
// target: 9 => ture
// target: 28 => false
// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    let val: Int
    
    init(_ val: Int) {
        self.val = val
    }
    
    convenience init(left: TreeNode?, right: TreeNode?, value: Int) {
        self.init(value)
        self.left = left
        self.right = right
        
    }
}



let node2 = TreeNode(left: nil, right: nil, value: 1)
let node4 = TreeNode(left: nil, right: nil, value: 4)
let node7 = TreeNode(left: nil, right: nil, value: 7)
let node3 = TreeNode(left: node2, right: node4, value: 3)
let node6 = TreeNode(left: nil, right: node7, value: 6)
let node5 = TreeNode(left: node3, right: node6, value: 5)
let node1 = TreeNode(left: nil, right: nil, value: 1)

class Solution: XCTestCase {
    static func findTarget(_ root: TreeNode? , _ k: Int) -> Bool {
        var set = Set<Int>()
        
        func findTarger2(_ node: TreeNode? , _ k: Int) -> Bool {
            var result = false
            if let right = node?.right {
                result = result || findTarger2(right, k)
            }
            
            if let left = node?.left {
                result = result || findTarger2(left, k)
            }
            
            if let val = node?.val {
                result = result || set.contains(k-val)
                set.insert(val)
            }
            return result
        }
        
        return findTarger2(root, k)
    }
    
    
    func testCase() {
        XCTAssertTrue(Solution.findTarget(node5, 9))
        XCTAssertFalse(Solution.findTarget(node5, 28))
        XCTAssertFalse(Solution.findTarget(node1, 2))
    }
}

Solution.defaultTestSuite.run()
