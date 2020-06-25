//
//  wordBreak.swift
//  leetSwift
//
//  Created by Fitz Wong on 25/6/2020.
//  Copyright © 2020 Fitz. All rights reserved.
//


/// # 139. Word Break
/// Given a non-empty string s and a dictionary wordDict containing a list of non-empty words,
/// determine if scan be segmented into a space-separated sequence of one or more dictionary words.
///
/// ## Note:
/// - The same word in the dictionary may be reused multiple times in the segmentation.
/// - You may assume the dictionary does not contain duplicate words.
///
/// ## Example 1:
/// - Input: s = "leetcode", wordDict = ["leet", "code"]
/// - Output: true
/// - Explanation: Return true because "leetcode" can be segmented as "leet code".
///
/// ## Example 2:
/// - Input: s = "applepenapple", wordDict = ["apple", "pen"]
/// - Output: true
/// - Explanation: Return true because "applepenapple" can be segmented as "apple pen apple". Note that you are allowed to reuse a dictionary word.
///
/// ## Example 3:
/// - Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
/// - Output: false
class WordBreak {
    /// wordBreak
    /// Parameter s:
    /// Parameter wordDict:
    /// Return:
    /// 动态规划
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // Array to Set, 后面可以快速搜索
        let wordMap = Set(wordDict)
        // 获取字典中最长和最短的长度
        let minlenth = wordMap.min {
            return $0.count < $1.count
            }?.count ?? 0
        let maxlenth = wordMap.max {
            return $0.count < $1.count
            }?.count ?? 0
        // 字符串 to 字符序列，方便索引
        let characters = Array(s)
        
        var dp = [Bool](repeating: false, count: s.count+1)
        dp[0] = true
        
        // 以最短为起点
        for i in minlenth...characters.count {
            // 以 i - 最长为结点
            let start = max(0, i - maxlenth)
            for r in start..<i {
//                print(i, r, start)
                if dp[r] {
                    let s = String(characters[r..<i])
                    if wordMap.contains(s) {
                        dp[i] = true
                        break
                    }
                }
            }
        }
        return dp.last!
        
    }
}
