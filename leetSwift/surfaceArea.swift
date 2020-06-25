//
//  surfaceArea.swift
//  leetSwift
//
//  Created by Wong Feng on 25/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//
// On a N * N grid, we place some 1 * 1 * 1 cubes.
// Each value v = grid[i][j] represents a tower of v cubes placed on top of grid cell (i, j).
// Return the total surface area of the resulting shapes.
//
//
// Example 1:
// Input: [[2]]
// Output: 10

// Example 2:
// Input: [[1,2],[3,4]]
// Output: 34

// Example 3:
// Input: [[1,0],[0,2]]
// Output: 16

// Example 4:
// Input: [[1,1,1],[1,0,1],[1,1,1]]
// Output: 32

// Example 5:
// Input: [[2,2,2],[2,1,2],[2,2,2]]
// Output: 46


import Foundation

class surfaceArea {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var result = 0
        for i in 0..<grid.count {
            for j in 0..<grid.count {
                guard grid[i][j] > 0 else {
                    continue
                }
                result += grid[i][j] * 4  + 2
                if i > 0 {
                    result -= min(grid[i - 1][j], grid[i][j]) * 2

                }
                if j > 0 {
                    result -= min(grid[i][j - 1], grid[i][j]) * 2
                }
            }
        }
        return result
    }
}
