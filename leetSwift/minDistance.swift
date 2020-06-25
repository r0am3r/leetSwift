//
//  minDistance.swift
//  leetSwift
//
//  Created by 王枫 on 6/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

import Foundation


class minDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let l1 = word1.count
        let l2 = word2.count

        if l1 == 0 || l2 == 0 {
            return l1 + l2
        }

        var D = [[Int]](repeating: [Int](repeating: 0, count: l1 + 1), count: l2 + 1)
        for i in 0...l1 {
            D[0][i] = i
        }
        for i in 0...l2 {
            D[i][0] = i
        }
        for i in 1...l2 {
            for j in 1...l1 {
                let left = D[i - 1][j] + 1
                let down = D[i][j - 1] + 1
                var leftDown = D[i - 1][j - 1]
                if word1[word1.index(word1.startIndex, offsetBy: i)] !=
                  word2[word2.index(word2.startIndex, offsetBy: j)] {
                    leftDown += 1
                }
                D[i][j] = min(leftDown, left, down)
            }
        }
        return D[l2][l1]
    }
}
