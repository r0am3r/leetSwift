//
//  permute.swift
//  leetSwift
//
//  Created by 王枫 on 25/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

//给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//
//示例:
//
//输入: [1,2,3]
//输出:
//[
//[1,2,3],
//[1,3,2],
//[2,1,3],
//[2,3,1],
//[3,1,2],
//[3,2,1]
//]


// 深度优先遍历， 回溯
//class Permute {
//    func permute(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//        let cnt = nums.count
//        if cnt != 0 {
//            var used = Array(repeating: false, count: cnt)
//            dsf(nums: nums, res: &res, used: &used, current: [Int](), first: 0)
//        }
//        return res
//    }
//    private func dsf(
//      nums: [Int], res: inout [[Int]], used: inout [Bool], current: [Int], first: Int) {
//        if current.count == nums.count {
//            res.append(current)
//            return
//        }
//        for i in 0..<nums.count {
//            if !used[i] {
//                used[i] = true
//                dsf(nums: nums, res: &res, used: &used, current: current + [nums[i]], first: i)
//                used[i] = false
//            }
//        }
//    }
//}

class Permute {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        if !nums.isEmpty {
            var newNums = nums
            dsf(target: &newNums, result: &res, floor: 0)
        }
        return res
    }

    private func dsf(target: inout [Int], result: inout [[Int]], floor: Int) {
        if floor == target.count {
            result.append(Array(target))
            return
        }
// MARK: 遍历每个元素，使其成为第一个元素 floor，然后递归处理 floor + 1..count 的子序列
        for i in floor..<target.count {
            if i != floor {
                (target[i], target[floor]) = (target[floor], target[i])
            }
            dsf(target: &target, result: &result, floor: floor + 1)
            if i != floor {
                (target[i], target[floor]) = (target[floor], target[i])
            }
        }
    }
}
