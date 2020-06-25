//
//  twoSum.swift
//  leetSwift
//
//  Created by Wong Feng on 22/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//
// Given an array of integers, return indices of the two numbers
// such that they add up to a specific target.
// You may assume that each input would have exactly one solution,
// and you may not use the same element twice.
//
// Example:
// Given nums = [2, 7, 11, 15], target = 9,
//
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].

import Foundation

class twoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var mp: [Int: Int] = [:]
        for (i, n)in nums.enumerated() {
            if let index = mp[target - n] {
                return [i, index]
            }
            mp[n] = i
        }
        return []
    }
}
