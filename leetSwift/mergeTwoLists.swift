//
//  mergeTwoLists.swift
//  leetSwift
//
//  Created by 王枫 on 1/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//



// Definition for singly-linked list.
class MTListNode {
    public var val: Int
    public var next: MTListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class mergeTwoLists {
    func mergeTwoLists(_ l1: MTListNode?, _ l2: MTListNode?) -> MTListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var newNode: MTListNode?
        newNode = MTListNode(-1)
        let head = newNode
        var la = l1, lb = l2
        while la != nil && lb != nil {
            if la!.val <= lb!.val {
                newNode!.next = la
                la = la!.next
            }
            else {
                newNode!.next = lb
                lb = lb!.next
            }
            newNode = newNode!.next
        }
        newNode!.next = la ?? lb
        return head!.next
    }
}
