//
//  subarraysDivByK.swift
//  leetSwift
//
//  Created by 王枫 on 27/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/// 974. Subarray Sums Divisible by K
/// Given an array A of integers, return the number of (contiguous, non-empty) subarrays that have a sum divisible by K.
/// ## Example 1:
/// - Input: A = [4,5,0,-2,-3,1], K = 5
/// - Output: 7
/// - Explanation: There are 7 subarrays with a sum divisible by K = 5:
/// - [4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
///
///
/// ## Note:
///
/// - 1 <= A.length <= 30000
/// - -10000 <= A[i] <= 10000
/// - 2 <= K <= 10000
class SubarraysDivByK {
    /// 连续子数组 [i,j] => prev[j] - prev[i - 1]
    /// 同余原理
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        var map:[Int: Int] = [0: 1]
        var result = 0
        var prev = 0;
        for n in A {
            prev = (prev + n) % K
            if prev < 0 {
                prev += K
            }
            if let cnt = map[prev] {
                result += cnt
                map[prev] = cnt + 1
            }
            else {
                map[prev] = 1
            }

        }
        return result
    }
}

