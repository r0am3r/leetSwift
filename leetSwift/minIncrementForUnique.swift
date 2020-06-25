//
//  minimumIncrementToMakeArrayUnique.swift
//  leetSwift
//
//  Created by Wong Feng on 22/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//
// Given an array of integers A, a move consists of choosing any A[i], and incrementing it by 1.
// Return the least number of moves to make every value in A unique.

// Example 1:
// Input: [1,2,2]
// Output: 1
// Explanation:  After 1 move, the array could be [1, 2, 3].
//
// Example 2:
// Input: [3,2,1,2,1,7]
// Output: 6
// Explanation:  After 6 moves, the array could be [3, 4, 1, 2, 5, 7].
// It can be shown with 5 or less moves
// that it is impossible for the array to have all unique values.
//
// Note:
// 0 <= A.length <= 40000
// 0 <= A[i] < 40000


class minIncrementForUnique {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        // 构造一个以数值为索引的数组，对应的值为该数值出现的次数
        // 同时标记一个最大数
        var counts = [Int](repeating: 0, count: 40001)
        var max = -1
        
        for a in A {
            counts[a] += 1
            max = max < a ? a : max
        }
        
        // 以最大值为限，遍历索引，将出现多次的值依次后退一位
        // 每次后退仅保留一个，其余的值为递增次数
        // 生成一个 Max + 1 的数组
        var i = 0
        var cnt  = 0
        while i < max {
            if counts[i] > 0 {
                let diff = counts[i] - 1
                cnt += diff
                counts[i + 1] += diff
            }
            i += 1
        }
        
        // 如果 max + 1 位有多次出现
        let diff = counts[max + 1] - 1
        cnt += (1 + diff) * diff / 2
        
        return cnt
    }
}
