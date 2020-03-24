//
//  masseuse.swift
//  leetSwift
//
//  Created by Wong Feng on 24/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//
//A popular masseuse receives a sequence of back-to-back appointment requests and is debating which ones to accept. She needs a break between appointments and therefore she cannot accept any adjacent requests. Given a sequence of back-to-back appoint­ ment requests, find the optimal (highest total booked minutes) set the masseuse can honor. Return the number of minutes.
//
//Note: This problem is slightly different from the original one in the book.
//
//
//
//Example 1:
//
//Input:  [1,2,3,1]
//Output:  4
//Explanation:  Accept request 1 and 3, total minutes = 1 + 3 = 4
//Example 2:
//
//Input:  [2,7,9,3,1]
//Output:  12
//Explanation:  Accept request 1, 3 and 5, total minutes = 2 + 9 + 1 = 12
//Example 3:
//
//Input:  [2,1,4,5,3,1,1,3]
//Output:  12
//Explanation:  Accept request 1, 3, 5 and 8, total minutes = 2 + 4 + 3 + 3 = 12

// 动态规划 dynamic programming
// 对任一 i 节点，存在2个结果，选择 get 和 不选择 noGet
// 选择该节点则前一点一定是不选择状态：前 i 个节点的值 = 前 i-1 节点的 noGet + i 值
// 而不选择该节点则前一点的状态未知：前 i 个节点的值 = 前 i-1 节点的 noGet 和 get 中最大的值
class masseuse {
    func masseuse(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var noGet = 0
        var get = nums[0]
        for n in nums[1..<nums.count] {
            let tempNoGet = max(noGet, get)
            let tempGet = noGet + n
            noGet = tempNoGet
            get = tempGet
        }
        return max(noGet, get)
    }
}
