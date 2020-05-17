//
//  maxProduct.swift
//  leetSwift
//
//  Created by 王枫 on 18/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/// 152. Maximum Product Subarray
/// Given an integer array nums, find the contiguous subarray within an array
/// (containing at least one number) which has the largest product.
///
/// ## Example 1:
/// - Input: [2,3,-2,4]
/// - Output: 6
/// - Explanation: [2,3] has the largest product 6.
///
/// ## Example 2:
/// - Input: [-2,0,-1]
/// - Output: 0
/// - Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
class Solution {
    /// 和求和不同，出现一次负数会减小值，但偶数次会得到更大的数
    func maxProduct(_ nums: [Int]) -> Int {
        // 记录上一次的最大值和最小值，最小值用于处理负数
        var minF = nums.first
        var maxF = nums.first
        var result = nums.first
        for n in nums[1...] {
            let maxT = maxF!
            let minT = minF!
            // 每次要比较三个值
            maxF = max(maxT * n, max(n,minT * n))
            minF = min(minT * n, min(n, maxT * n))
            result = max(result!, maxF!)
        }
        return result!
    }
}
