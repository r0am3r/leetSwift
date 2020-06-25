//
//  sortArray.swift
//  leetSwift
//
//  Created by 王枫 on 31/3/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

import Foundation

class sortArray {
    func sortArray(_ nums: [Int]) -> [Int] {
        let length = nums.count
        if length < 2 {
            return nums
        }
        
        let mid = length / 2
        let left = sortArray(Array(nums[..<mid]))
        let right = sortArray(Array(nums[mid...]))
        
        var result = [Int]()
        
        var l = 0, r = 0
        while l < left.count && r < right.count {
            if left[l] >= right[r] {
                result.append(right[r])
                r += 1
            } else {
                result.append(left[l])
                l += 1
            }
        }
        if l < left.count {
            result.append(contentsOf: left[l...])
        }
        if r < right.count {
            result.append(contentsOf: right[r...])
        }
        return result
    }
}
