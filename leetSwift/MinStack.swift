//
//  MinStack.swift
//  leetSwift
//
//  Created by 王枫 on 12/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/// 155. Min Stack
/// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
///
/// push(x) -- Push element x onto stack.
/// pop() -- Removes the element on top of the stack.
/// top() -- Get the top element.
/// getMin() -- Retrieve the minimum element in the stack.
///
///
/// Example 1:
///
/// Input
/// ["MinStack","push","push","push","getMin","pop","top","getMin"]
/// [[],[-2],[0],[-3],[],[],[],[]]
///
/// Output
/// [null,null,null,null,-3,null,0,-2]
///
/// Explanation
/// MinStack minStack = new MinStack();
/// minStack.push(-2);
/// minStack.push(0);
/// minStack.push(-3);
/// minStack.getMin(); // return -3
/// minStack.pop();
/// minStack.top();    // return 0
/// minStack.getMin(); // return -2
///
///
/// Constraints:
///
/// Methods pop, top and getMin operations will always be called on non-empty stacks.
/// Array 实现：同时使用额外的 Array 存储对位的最小值
class MinStack {
    // 栈列
    var _stack: [Int] = []
    // 对位最小值序列
    var _minimum: [Int] = []

    /** initialize your data structure here. */
    init() {}

    // 优化， 只在出现比最小序列队尾更小值的时候，写最小序列
    func push(_ x: Int) {
        _stack.append(x)
        if _minimum.isEmpty || _minimum.last! >= x {
            _minimum.append(x)
        }
    }

    func pop() {
        let tmp = _stack.removeLast()
        if tmp == _minimum.last!{
            _minimum.removeLast()
        }
    }

    func top() -> Int {
        return _stack.last!
    }

    func getMin() -> Int {
        return _minimum.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
