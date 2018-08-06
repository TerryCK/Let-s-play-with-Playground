//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

//https://leetcode.com/problems/add-two-numbers/description/

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(val: Int) {
        self.val = val
    }
    
    func traversal() {
        print(val)
        next?.traversal()
    }
    
    func combine() -> String? {
        return String(val).appending(next?.combine() ?? "")
    }
}

class LinkedList: ExpressibleByArrayLiteral, CustomDebugStringConvertible {
    typealias ArrayLiteralElement = Int
    
    var head: ListNode?
    var debugDescription: String {
        print("LinkedList")
            head?.traversal()
            return "--------"
    }
    
    required init(arrayLiteral elements: Int...) {
        var head: ListNode? = nil
        elements.forEach { (val) in
            let node = ListNode(val: val)
            node.next = head
            head = node
        }
        self.head = head
    }
    
}


extension Array where Element == Int {
    var getReverseLinkList: ListNode? {
        var head: ListNode? = nil
        self.forEach { (val) in
            let node = ListNode(val: val)
            node.next = head
            head = node
        }
        return head
    }
}


let l3: LinkedList = [3,4,2]



let l1 = [3,4,2].getReverseLinkList
let l2 = [5,6,4].getReverseLinkList

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = Int(l1?.combine() ?? "0")! + Int(l2?.combine() ?? "0")!
        return String(result).compactMap {  Int(String($0)) }.getReverseLinkList
    }
}

Solution().addTwoNumbers(l1, l2)?.combine()


