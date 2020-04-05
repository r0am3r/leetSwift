//
//  trap.swift
//  leetSwift
//
//  Created by 王枫 on 4/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

import Foundation

class trap {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        var maxLeft = 0, maxRight = 0
        var left = 0, right = height.count - 1
        
        while left < right {
            if height[left] < height[right] {
                if height[left] >= maxLeft {
                    maxLeft = height[left]
                } else {
                    result += maxLeft - height[left]
                }
                left += 1
            } else {
                if height[right] >= maxRight {
                    maxRight = height[right]
                } else {
                    result += maxRight - height[right]
                }
                right -= 1
            }
        }
        return result
    }
}
