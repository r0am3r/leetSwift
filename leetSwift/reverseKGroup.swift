//
//  addTwoNumbers.swift
//  leetSwift
//
//  Created by Wong Feng on 23/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//

/// 25. Reverse Nodes in k-Group
/// Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
/// 
/// k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
/// 
/// Example:
/// 
/// Given this linked list: 1->2->3->4->5
/// 
/// For k = 2, you should return: 2->1->4->3->5
/// 
/// For k = 3, you should return: 3->2->1->4->5
/// 
/// Note:
/// 
/// Only constant extra memory is allowed.
/// You may not alter the values in the list's nodes, only nodes itself may be changed.
class ReverseKGroup {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

   func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let s: ListNode? = ListNode.init(0)
        s!.next = head
        var pre: ListNode? = s
        var end: ListNode? = s
        
        while (end!.next != nil) {
            var count: Int = 0
            while(end != nil && count < k){
                end = end!.next
                count += 1
            }
            if (end == nil) {break}
            let start: ListNode? = pre!.next
            let next: ListNode? = end!.next
            end!.next = nil
            pre!.next = reverse(start)
            start!.next = next
            pre = start
            end = pre
        }
        return s!.next
    }
    func reverse(_ cur:ListNode?) -> ListNode?{
        var pre: ListNode? = nil
        var head: ListNode? = cur
        while(head != nil){
            let next: ListNode? = head!.next
            head!.next = pre
            pre = head
            head = next
        }
        return pre
    }
}
