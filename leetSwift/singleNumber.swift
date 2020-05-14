//
//  BST.swift
//  leetSwift
//
//  Created by 王枫 on 5/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/// 136. Single Number
/// Given a non-empty array of integers, every element appears twice except for one. 
/// Find that single one.
/// 
/// ## Note:
/// Your algorithm should have a linear runtime complexity. Could you implement it 
/// without using extra memory?
/// 
/// ## Example 1:
/// - Input: [2,2,1]
/// - Output: 1
/// 
/// ## Example 2:
/// - Input: [4,1,2,1,2]
/// - Output: 4

class singleNumber {
    /// - c = a ^ b
    /// - a = c ^ b
    /// - b = c ^ a
    /// - a ^ a = 0
    func singleNumber(_ nums: [Int]) -> Int {
        var tmp = 0
        for n in nums {
            tmp ^= n
        }
        return tmp
    }
}