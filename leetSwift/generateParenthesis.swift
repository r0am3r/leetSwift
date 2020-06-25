//
//  generateParenthesis.swift
//  leetSwift
//
//  Created by 王枫 on 9/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 */
import Foundation


class generateParenthesis {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backtrack(&result, "", 0, 0, n)
        return result
    }

    func backtrack(_ result: inout [String], _ current: String, _ o: Int, _ c: Int, _ n: Int) {
        if current.count == n * 2 {
            result.append(current)
            return
        }
        if o < n {
            backtrack(&result, current + "(", o + 1, c, n)
        }
        if c < o {
            backtrack(&result, current + ")", o, c + 1, n)
        }
    }
}
