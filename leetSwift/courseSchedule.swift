//
//  courseSchedule.swift
//  leetSwift
//
//  Created by 王枫 on 17/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


class CourseSchedule {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var edges: [Int: [Int]] = [:]

        for prerequisite in prerequisites {
            edges[prerequisite[1], default: []].append(prerequisite[0])
        }

        var memo: [Int: Int] = [:]
        var isInvalid = false
        var result: [Int] = []

        func dfs(_ i: Int) {
            memo[i] = 1

            for j in edges[i] ?? [] {
                if memo[j] == nil {
                    dfs(j)
                    if isInvalid { return }
                } else if memo[j] == 1 {
                    isInvalid = true
                    return
                }
            }

            memo[i] = 2
            result.append(i)
        }

        for i in 0 ..< numCourses where !isInvalid && memo[i] == nil {
            dfs(i)
        }

        if isInvalid { return [] }

        return result.reversed()
    }
}
