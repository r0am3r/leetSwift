//
//  BST.swift
//  leetSwift
//
//  Created by 王枫 on 5/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/// 560. Subarray Sum Equals K
/// 
/// Given an array of integers and an integer k, you need to find the total number of continuous
/// subarrays whose sum equals to k.
/// 
/// ## Example 1:
/// - Input:nums = [1,1,1], k = 2
/// - Output: 2
/// 
///  
/// Constraints:
/// - The length of the array is in range [1, 20,000].
/// - The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7.
class SubarraySum {
    /// ## 1.穷举
    /// 对于每一个 nums[0...i] 的子序列，当 0 <= j <= i 时，使得 nums[j, i] 的和为 k
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        let len = nums.count

        for i in 0..<len {
            var j = i
            var s = 0
            while j >= 0 {
                s += nums[j]
                if s == k {
                    result += 1
                }
                j -= 1
            }
        }
        return result
    }

    /// ## 2.优化穷举
    /// - 设 prev[i] 表示 0...i 的和，推出 prev[i] = prev[i - 1] + nums[i]
    /// - 对于满足条件的子序列 nums[j...i]
    ///     - 即：k = prev[i] - prev[j - 1], 
    ///     - 推出 prev[j - 1] = prev[i] - k
    /// - 问题转化为有统计前缀和为 prev[j - 1]的子序列的数量
    /// 
    /// 建立缓存：mp[前缀和] = 出现次数
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var cnts = [0:1]
        var result = 0
        var prev = 0
        for i in nums {
            // 前 i 项的和
            prev += i
            // 如果 prev[j - 1] 出现过
            if let n = cnts[prev - k] {
                result += n
            }
            // 缓存 pre[i]
            cnts[prev, default: 0] += 1
        }
        return result
    }
}