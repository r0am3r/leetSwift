//
//  LFUCache.swift
//  leetSwift
//
//  Created by 王枫 on 5/4/2020.
//  Copyright © 2020 fitz. All rights reserved.
//

/*
 Design and implement a data structure for Least Frequently Used (LFU) cache.
 It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache,
 otherwise return -1.
 put(key, value) - Set or insert the value if the key wr34es not already present.
 When the cache reaches its capacity, it should invalidate the least frequently used item
 before inserting a new item.For the purpose of this problem, when there is a tie (i.e.,
 two or more keys that have the same frequency), the least recently used key would be evicted.

 Note that the number of times an item is used is the number of calls to the get
 and put functions for that item since it was inserted. This number is set to zero
 when the item is removed.

  
 Follow up:
 Could you do both operations in O(1) time complexity?

  
 Example:

 LFUCache cache = new LFUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.get(3);       // returns 3.
 cache.put(4, 4);    // evicts key 1.
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 */
import Foundation


class LFUCache {

    var capacity: Int
    var count: Int
    var min: Int
    var nodeMap: [Int: DLNode]
    var countMap: [Int: DLList]
    init(_ capacity: Int) {
        self.capacity = capacity
        self.count = 0
        self.min = Int.max
        self.nodeMap = [Int: DLNode]()
        self.countMap = [Int: DLList]()
    }

    func get(_ key: Int) -> Int {
        if let node = nodeMap[key] {
            updateNode(node)
            return node.value
        }
        else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = nodeMap[key] {
            node.value = value
            updateNode(node)
        } else {
            if count == capacity {
                if let minList = countMap[min] {
                    let removed = minList.removeLast()
                    nodeMap[removed.key] = nil
                    count -= 1
                }
            }
            let node = DLNode(key, value)
            nodeMap[key] = node
            if let firstList = countMap[1] {
                firstList.add(node)
            } else {
                countMap[1] = DLList(node)
            }
            count += 1
            min = 1
        }
    }
    private func updateNode(_ node: DLNode) {
        if let list = countMap[node.count] {
            list.remove(node)
            if node.count == min, list.isEmpty {
                min += 1
            }
            node.count += 1
            if let newList = countMap[node.count] {
                newList.add(node)
            } else {
                countMap[node.count] = DLList(node)
            }
        }
    }

}




class DLNode {
    var key: Int
    var value: Int
    var count: Int
    var pre: DLNode?
    var next: DLNode?
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
        count = 1
    }
}

class DLList {
    var head: DLNode
    var tail: DLNode
    var isEmpty: Bool {
        return head.next === tail && tail.pre === head
    }
    init(_ node: DLNode) {
        head = DLNode(0, 0)
        tail = DLNode(0, 0)
        head.next = node
        node.pre = head
        node.next = tail
        tail.pre = node

    }
    func add(_ node: DLNode) {
        node.pre = head
        node.next = head.next
        node.next?.pre = node
        head.next = node
    }
    func remove(_ node: DLNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    func removeLast() -> DLNode {
        let node = tail.pre!
        remove(node)
        return node
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
        
