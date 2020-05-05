//
//  jump.swift
//  leetSwift
//
//  Created by 王枫 on 4/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


class Jump {
    /**
     # leetcode-45 jUMP GAME2
     Given an array of non-negative integers, you are initially positioned at the first index of the array.
     Each element in the array represents your maximum jump length at that position.
     Your goal is to reach the last index in the minimum number of jumps.

     - Parameter nums: an array of non-negative integers

     - Returns: reach the last index in the minimum number of jumps

     ## Example:

     - Input: [2,3,1,1,4]
     - Output: 2

     ## Explanation:
     The minimum number of jumps to reach the last index is 2.
     Jump 1 step from index 0 to 1, then 3 steps to the last index.

     # Note:

     You can assume that you can always reach the last index.
    */
    func jump(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        var result = 0
        var limit = 0
        var maxPos = 0
        for i in 0..<nums.count - 1 {
            maxPos = max(maxPos, i + nums[i])
            if i == limit {
                limit = maxPos
                result += 1
            }
        }
        return result
    }

    /**
     # leetcode-55 JUMP GAME

     Given an array of non-negative integers, you are initially positioned at the first index of the array.
     Each element in the array represents your maximum jump length at that position.
     Determine if you are able to reach the last index.

     - Parameter nums: an array of non-negative integers

     - Returns: if you are able to reach the last index

     ## Example 1:

     - Input: nums = [2,3,1,1,4]
     - Output: true

     ## Explanation:
     Jump 1 step from index 0 to 1, then 3 steps to the last index.

     ## Example 2:

     - Input: nums = [3,2,1,0,4]
     - Output: false

     ## Explanation:
     You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.


     ## Constraints:

     - 1 <= nums.length <= 3 * 10^4
     - 0 <= nums[i][j] <= 10^5
     */
    func canJump(_ nums: [Int]) -> Bool {
        var maxPos = 0
        for i in 0..<nums.count {
            if i <= maxPos {
                maxPos = max(maxPos, i + nums[i])
                if maxPos >= nums.count - 1 {
                    return true
                }
            }
        }
        return false
    }
}
