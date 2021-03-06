//
//  addTwoNumbers.swift
//  leetSwift
//
//  Created by Wong Feng on 23/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//

// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in reverse order and each of their nodes contain a single digit.
// Add the two numbers and return it as a linked list.
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.


// Example:
// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)

// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.


import Foundation

// Definition for singly-linked list.
public class addTwoNumbersListNode {
    public var val: Int
    public var next: addTwoNumbersListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class addTwoNumbers {
    func addTwoNumbers(_ l1: addTwoNumbersListNode?, _ l2: addTwoNumbersListNode?) -> addTwoNumbersListNode? {
        var m = 0
        var l1Node = l1
        var l2Node = l2
        var resultNode: addTwoNumbersListNode?
        var currentResultNode: addTwoNumbersListNode?
        while (l1Node != nil || l2Node != nil || m > 0) {
            let l1Value = l1Node?.val ?? 0
            let l2Value = l2Node?.val ?? 0
            var value = l1Value + l2Value + m
            let newNode: addTwoNumbersListNode
            if (value >= 10) {
                m = 1
                value = value % 10
            } else {
                m = 0
            }
            newNode = addTwoNumbersListNode(value)
            if (currentResultNode == nil) {
                currentResultNode = newNode
                resultNode = newNode
            } else {
                currentResultNode?.next = newNode
                currentResultNode = newNode
            }
            l1Node = l1Node?.next
            l2Node = l2Node?.next
        }
        return resultNode
    }
}
