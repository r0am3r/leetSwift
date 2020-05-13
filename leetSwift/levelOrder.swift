//
//  levelOrder.swift
//  leetSwift
//
//  Created by 王枫 on 13/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//
/// 102. Binary Tree Level Order Traversal
/// Given a binary tree, return the level order traversal of its nodes' values.
/// (ie, from left to right, level by level).
///
/// For example:
/// Given binary tree [3,9,20,null,null,15,7],
///
/// 3
/// / \
/// 9  20
/// /  \
/// 15   7
/// return its level order traversal as:
///
/// [
/// [3],
/// [9,20],
/// [15,7]
/// ]

class LevelOrder {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    /// 广度优先遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [[]]
        }
        // 结果
        var result: [[Int]] = []
        // 记录上一层节点，遍历完当前层，赋值currentFloor，进入下一层
        var lastFloor = [root!]
        // 记录当前层节点
        var currentFloor: [TreeNode] = []

        while !lastFloor.isEmpty{
            // 记录当前层节点值
            var tmp = [Int]()
            for t in lastFloor {
                tmp.append(t.val)
                if let l = t.left {
                    currentFloor.append(l)
                }
                if let r = t.right{
                    currentFloor.append(r)
                }
            }
            // 准备进入下一层
            result.append(tmp)
            lastFloor.removeAll()
            lastFloor = currentFloor
            currentFloor.removeAll()
        }

        return result
    }
}
