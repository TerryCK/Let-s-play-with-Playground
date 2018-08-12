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

// thinking path, get Int number from linked list, than execute operator +, and transform to linked list

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
    
    func traversal() {
        print(val)
        next?.traversal()
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
            let node = ListNode(val)
            node.next = head
            head = node
        }
        self.head = head
    }
}





let l3: LinkedList = [3,4,2]

extension ListNode {
    func combine() -> String? {
        return String(val).appending(next?.combine() ?? "")
    }
}
extension Array where Element == Int {
    var getReverseLinkList: ListNode? {
        var head: ListNode? = nil
        forEach { (val) in
            let node = ListNode(val)
            node.next = head
            head = node
        }
        return head
    }
}
let l1 = [3,4,2,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1].getReverseLinkList
//let l1 = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1].getReverseLinkList
let l2 = [5,6,4].getReverseLinkList
l1?.combine()

class SolutionVersion1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = Int(l1?.combine() ?? "0")! + Int(l2?.combine() ?? "0")!
        return String(result).flatMap { Int(String($0)) }.getReverseLinkList
    }
}

SolutionVersion1().addTwoNumbers(l1, l2)?.combine()


class SolutionV2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2, carry = 0
        let headOfLinkedList = ListNode(0)
        var node = headOfLinkedList
        
        while l1 != nil || l2 != nil || carry != 0 {
            if let val = l1?.val {
                carry += val
                l1 = l1?.next
            }
            if let val = l2?.val {
                carry += val
                l2 = l2?.next
            }
            
            node.next = ListNode(carry % 10)
            node = node.next!
           carry = carry / 10
        }
        return headOfLinkedList
    }
}

// O(n)
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let headOfLinkedList = ListNode(0)
        var l1 = l1, l2 = l2, carry = 0
        var node = headOfLinkedList
        
        while l1 != nil || l2 != nil {
            carry += (l1?.val ?? 0) + (l2?.val ?? 0)
            (l1, l2) = (l1?.next, l2?.next)
            node.next = ListNode(carry % 10)
            node = node.next!
            carry = carry / 10
        }
        
        if carry > 0 {
            node.next = ListNode(carry % 10)
        }
        
        return headOfLinkedList.next
    }
}


Solution().addTwoNumbers(l1, l2)?.combine()
