//
//  removeDuplicateNodes.swift
//  leetSwift
//
//  Created by Fitz Wong on 26/6/2020.
//  Copyright © 2020 Fitz. All rights reserved.
//


/// # 面试题 02.01. Remove Duplicate Node LCCI
/// Write code to remove duplicates from an unsorted linked list.
///
/// ## Example1:
/// - Input: [1, 2, 3, 3, 2, 1]
/// - Output: [1, 2, 3]
///
/// ## Example2:
/// - Input: [1, 1, 1, 1, 2]
/// - Output: [1, 2]
///
/// ## Note:
/// - The length of the list is within the range[0, 20000].
/// - The values of the list elements are within the range [0, 20000].
class RemoveDuplicateNodes {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
        
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        let newHead: ListNode = head!
        var iter: ListNode = head!
        var beenThere: Set = [iter.val]
        while iter.next != nil {
            if beenThere.contains(iter.next!.val) {
                iter.next = iter.next!.next
            }
            else {
                beenThere.insert(iter.next!.val)
                iter = iter.next!
            }
        }
        
        return newHead
        
    }
}
