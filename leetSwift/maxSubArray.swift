//
//  maxSubArray.swift
//  leetSwift
//
//  Created by 王枫 on 3/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


class maxSubArray {
// 动态规划
//    func maxSubArray(_ nums: [Int]) -> Int {
//        var result = nums[0]
//        var pre = 0
//        for n in nums {
//            pre = max(pre + n, n)
//            result = max(result, pre)
//        }
//        return result
//    }


    // 分治法
    // 将数组分成2部分，start = 0, end = nums.count, mid = start + end / 2
    // 最大子序列出现以下几种情况：
    // lSum: 以 start 为左侧起点的子序列: Start...N, N 可能小于等于 mid， 也可能大于 mid
    // rSum: 以 end 为右侧终点的子序列: N...end, N 可能小于等于 mid， 也可能大于 mid
    // iSum: 包含全部元素
    // mSum: 左侧的中间部分，或右侧的中间部分，或者整个序列的中间部分
    // 当序列只有一个元素时，4个值都是该元素
    func maxSubArray(_ nums: [Int]) -> Int {
        var arr = nums
        return _get(&arr, 0, nums.count - 1).mSum
    }

    private func _get(_ nums: inout [Int], _ start: Int, _ end: Int) ->
      (mSum: Int, iSum: Int, lSum: Int, rSum: Int) {
        if start == end {
            return (nums[start], nums[start], nums[start], nums[start])
        }
        let mid = (start + end) >> 1
        let (lm, li, ll, lr) = _get(&nums, start, mid)
        let (rm, ri, rl, rr) = _get(&nums, mid + 1, end)
        return (
          max(max(lm, rm), lr + rl),
          li + ri,
          max(ll, li + rl),
          max(rr, lr + ri)
        )
    }
}
