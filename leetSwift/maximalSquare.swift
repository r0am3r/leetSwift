//
//  maximalSquare.swift
//  leetSwift
//
//  Created by 王枫 on 8/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


/// leetcode 221
/// Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's
/// and return its area.
/// 
/// ## Example:
///
/// Input:
///
/// 1 0 1 0 0
///
/// 1 0 1 1 1
///
/// 1 1 1 1 1
///
/// 1 0 0 1 0
///
/// Output: 4
///

/// ## 1.暴力遍历
/// 遍历每个元素，并以其为左上角，然后每次增加一行或一列，判断增加的行或列的最大范围

class MaximalSquare {
    /// ## 2.动态规划
    /// dp(i, j) 表示以（i, j）为右下角，且只包含“1”的正方形的最大边长
    /// dp[i][j] 由 dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] 决定，其值为三者最小值加一
    /// 
    /// - Parameters:
    ///     - matrix: a 2D binary matrix filled with 0's and 1's
    ///
    /// - Returns: largest square containing only 1's
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var maxSide = 0
        if matrix.isEmpty || matrix[0].isEmpty {
            return maxSide
        }
        let rows = matrix.count
        let columns = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
        for i in 0..<rows {
            for j in 0..<columns {
                // 只需要处理 1， 0不可能出现在矩形中
                if matrix[i][j] == "1" {
                    // 处理边界
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    }
                    else {
                        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    }
                    // 记录最大边长
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
}
