//
//  BST.swift
//  leetSwift
//
//  Created by 王枫 on 5/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


/// BST
class BST {
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
    /// Given a binary tree, determine if it is a valid binary search tree (BST).
    ///
    /// - Parameter root: root of a binary tree
    ///
    /// - Returns: true for a valid BST
    ///
    /// ## Example 1:
    ///
    /// 2
    /// / \
    /// 1   3
    ///
    /// - Input: [2,1,3]
    /// - Output: true
    ///
    /// ## Example 2:
    ///
    /// 5
    /// / \
    /// 1   4
    ///    / \
    ///   3   6
    ///
    /// - Input: [5,1,4,null,null,3,6]
    /// - Output: false
    ///
    /// ## Explanation:
    /// The root node's value is 5 but its right child's value is 4.
    ///

    /// 1. Recursive
    /// 递归判断每一个节点的值是否满足 BST
    /// func isValidBST(_ root: TreeNode?) -> Bool {
    ///     return _validNode(root, lower: Int.min, upper: Int.max)
    /// }
    ///
    /// private func _validNode(_ root: TreeNode?, lower: Int, upper: Int) -> Bool {
    ///     if root == nil {
    ///         return true
    ///     }
    ///     if root!.val <= lower || root!.val >= upper {
    ///         return false
    ///     }
    ///     return _validNode(root!.left, lower: lower, upper: root!.val) &&
    ///         _validNode(root!.right, lower: root!.val, upper: upper)
    /// }
    ///
    /// 2. 中序遍历
    /// func isValidBST(_ root: TreeNode?) -> Bool {
    ///     var stack = Array<TreeNode>()
    ///     var tmpRoot = root
    ///     var prevVal = Int.min
    ///     while !stack.isEmpty || tmpRoot != nil {
    ///         while tmpRoot != nil {
    ///             stack.append(tmpRoot!)
    ///             tmpRoot = tmpRoot!.left
    ///         }
    ///         tmpRoot = stack.last
    ///         stack.removeLast()
    ///         if tmpRoot!.val <= prevVal {
    ///             return false
    ///         }
    ///         prevVal = tmpRoot!.val
    ///         tmpRoot = tmpRoot?.right
    ///     }
    ///     return true
    /// }

    // prevVal 不能在递归函数里赋值
    var prevVal = Int.min
    func  isValidBST(_ root: TreeNode?) -> Bool {
        if let root = root {
            if !isValidBST(root.left) {
                return false
            }
            if root.val <= prevVal {
                return false
            }
            prevVal = root.val
            return isValidBST(root.right)
        }
        return true
    }
}
