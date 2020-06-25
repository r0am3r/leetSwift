//
//  lengthOfLongestSubstring.swift
//  leetSwift
//
//  Created by Wong Feng on 22/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//

//Given a string, find the length of the longest substring without repeating characters.
//
//
//Example 1:
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.

//Example 2:
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.

//Example 3:
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

//import Foundation
//
class lengthOfLongestSubstring {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        if s.count < 2 {
//            return s.count
//        }
//        var result = 0
//        var str = String()
//        for c in s {
//            while str.contains(c) {
//                str.remove(at: str.startIndex)
//            }
//            str.append(c)
//            result = max(str.count, result)
//        }
//        return result
//    }
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // window 窗口内不能含有重复字符
        var left = 0
        var right = 0
        var result = 0

        let utf8Chars = Array(s.utf8)
        var window = [Int](repeating: 0, count: 128) // 只包含单字符字母（ASCII字符 0-127），使用128长度数组存储，ASCII值作为索引

        let count = utf8Chars.count
        while right < count {
            // 1.扩大窗口 右移right (加入right字符)
            let char1 = utf8Chars[right]
            let charToIndex1 = Int(char1)
            window[charToIndex1] += 1
            right += 1

            // 2.缩小窗口 右移left  (去掉left字符)
            while window[charToIndex1] > 1 {// 发现重复字符
                let char2 = utf8Chars[left]
                let charToIndex2 = Int(char2)
                window[charToIndex2] -= 1
                left += 1
            }

            // 3.在这里窗口已经缩到满足条件（不包含重复字符）
            result = max(result, right - left) // 更新result
        }
        return result
    }
}
