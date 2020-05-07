//
//  isSubtree.swift
//  leetSwift
//
//  Created by 王枫 on 4/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


/// Given two non-empty binary trees s and t, check whether tree t has exactly the same structure
/// and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all
/// of this node's descendants. The tree s could also be considered as a subtree of itself.
/// 
/// ## Example 1:
/// Given tree s:
/// 
///      3
///     / \
///    4   5
///   / \
///  1   2
/// 
/// Given tree t:
/// 
///    4 
///   / \
///  1   2
/// 
/// Return true, because t has the same structure and node values with a subtree of s.
/// 
/// ## Example 2:
/// Given tree s:
/// 
///      3
///     / \
///    4   5
///   / \
///  1   2
///     /
///    0
/// 
/// Given tree t:
/// 
///    4
///   / \
///  1   2
/// 
/// Return false. 

class isSubtree {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    /// 1. 暴力匹配
    /// 遍历 s, 找到所以 val 等于 t 的根节点，然后判断以该节点为根的子树和 t 是否一致
    /// - Parameter:
    ///     - s: TreeNode 树
    ///     - t: TreeNode 树
    ///
    /// - Returns: t 属于 s 的子串，返回 true
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil {
            return false
        }
        return _check(s, t) || isSubtree(s!.left, t) || isSubtree(s!.right, t)
    }

    private func _check(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if s == nil || t == nil || s!.val != t!.val {
            return false
        }
        return _check(s!.left, t!.left) && _check(s!.right, t!.right)
    }

    
}