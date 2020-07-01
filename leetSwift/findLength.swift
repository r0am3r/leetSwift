//
//  findLength.swift
//  leetSwift
//
//  Created by Fitz Wong on 1/7/2020.
//  Copyright © 2020 Fitz. All rights reserved.
//


/// # 718. Maximum Length of Repeated Subarray
/// Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.
///
/// ## Example 1:
///
/// - Input:
///     - A: [1,2,3,2,1]
///     - B: [3,2,1,4,7]
/// - Output: 3
///
/// ## Explanation:
/// The repeated subarray with maximum length is [3, 2, 1].
///
///
/// ## Note:
/// - 1 <= len(A), len(B) <= 1000
/// - 0 <= A[i], B[i] < 100
class FindLength {
    /// 动态规划
    /// dp 保存了 A[i..] 和 B[j..]公共前缀的长度，dp[i][j]中的最大值即为最长值
    /// 如果 A[i] == B[j], 则 dp[i][j] 的值为 dp[i + 1][j + 1] + 1
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        let la = A.count
        let lb = B.count
        // 记录最大值，用于比较并返回
        var maxLength = 0
        // 初始化 dp，长度要比输入数组长度 + 1
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: lb + 1), count: la + 1)
        var i = la - 1
        while i >= 0 {
            var j = lb - 1
            while j >= 0 {
                // 如果找到相同元素，长度 + 1
                if A[i] == B[j] {
                    dp[i][j] = dp[i + 1][j + 1] + 1
                }
                maxLength = max(maxLength, dp[i][j])
                j -= 1
            }
            i -= 1
        }
        return maxLength
    }
    
    
    /// 滑动窗口
    /// 通过错位找到A 和 B 相同前缀的子序列，进行对齐
    /// 对齐有2种情况：
    /// - A 的首元素依次和B 的每一个元素对齐
    /// - B 的首元素依次和A 的每一个元素对齐
    func findLength1(_ A: [Int], _ B: [Int]) -> Int {
        var ret = 0
        let la = A.count
        let lb = B.count
        
        // B 的首元素依次和A 的每一个元素对齐
        for (i, _) in A.enumerated() {
            let step = min(lb, la - i)
            let len = _maxLength(A: A, fromA: i, B: B, fromB: 0, step: step)
            ret = max(ret, len)
        }
        // A 的首元素依次和B 的每一个元素对齐
        for (i, _) in B.enumerated() {
            let step = min(la, lb - i)
            let len = _maxLength(A: A, fromA: 0, B: B, fromB: i, step: step)
            ret = max(ret, len)
        }
        return ret
    }
    
    /// 查找A[fromA:] 和 B[fromB:]的最长前缀
    /// - Parameters:
    ///     - A:
    ///     - fromA: a 的开始位置
    ///     - B:
    ///     - fromB: b 的开始位置
    ///     - step: 查找的长度
    /// - Returns: 最大长度
    private func _maxLength(A a: [Int], fromA sa: Int, B b: [Int], fromB sb: Int, step n: Int) -> Int {
        var ret = 0
        var tmp = 0
        for i in 0..<n {
            if a[sa + i] == b[sb + i] {
                tmp += 1
            }
            else {
                // 不相等，长度清零
                tmp = 0
            }
            ret = max(ret, tmp)
        }
        return ret
    }
}
