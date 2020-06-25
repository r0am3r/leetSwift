//
//  isHappy.swift
//  leetSwift
//
//  Created by 王枫 on 30/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


//编写一个算法来判断一个数 n 是不是快乐数。
//
//「快乐数」定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。如果 可以变为  1，那么这个数就是快乐数。
//
//如果 n 是快乐数就返回 True ；不是，则返回 False 。
//
//
//
//示例：
//
//输入：19
//输出：true
//解释：
//12 + 92 = 82
//82 + 22 = 68
//62 + 82 = 100
//12 + 02 + 02 = 1


class IsHappy{
    func isHappy(_ n: Int) -> Bool {
        var loop = Set<Int>()
        return _test(n, &loop)
    }

    private func _test(_ n: Int, _ loop: inout Set<Int>) -> Bool {
        var tmp = 0, nn = n

        if n == 1 {
            return true
        }
        while nn != 0 {
            let m = nn % 10
            tmp += m * m
            nn /= 10
        }
        if tmp == 1 {
            return true
        }
        else if loop.contains(tmp) {
            return false
        }
        else {
            loop.insert(tmp)
            return _test(tmp, &loop)
        }
    }
}


