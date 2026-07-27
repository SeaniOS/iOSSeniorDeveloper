//
//  LeetCode146_LRUCache.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// doubly linked list with next & prev nodes
class Node {
    let key: Int
    var value: Int
    var prev: Node? /// previous
    var next: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    let capacity: Int
    var dict: Dictionary<Int, Node> = [:]
    /// using head & tail to find which node is least recently used in O(1)
    var head: Node = Node(key: -1, value: -1) // most
    var tail: Node = Node(key: -1, value: -1) // least
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard dict.keys.contains(key), let node = dict[key] else { return -1 }
        
        update(node) // update node to be most recently used
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if dict.keys.contains(key) { // key did exists
            if let node = dict[key] {
                node.value = value // node will be updated because it's a class
                
                update(node) // update node to be most recently used
            }
        } else {
            // create a new node
            let node = Node(key: key, value: value)
            
            if dict.count == capacity, let least = tail.prev {
                // cache did reach capacity: evict the least recently used
                dict.removeValue(forKey: least.key) // here's why we need to keep the key for node
                delete(least)
            }
            
            // insert new node
            dict[key] = node
            add(node)
        }
    }
}

extension LRUCache {
    private func add(_ node: Node) {
        let nextNode = head.next
        
        head.next = node
        node.next = nextNode
        
        nextNode?.prev = node
        node.prev = head
    }
    
    private func delete(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }
    
    private func update(_ node: Node) {
        delete(node)
        add(node)
    }
}

class LeetCode146_LRUCache {
    
}

extension LeetCode146_LRUCache {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        /**
         * Your LRUCache object will be instantiated and called as such:
         * let obj = LRUCache(capacity)
         * let ret_1: Int = obj.get(key)
         * obj.put(key, value)
         */
        let capacity = 4
        let obj = LRUCache(capacity)
        
        let key = 0
        let ret_1: Int = obj.get(key)
        
        let value = 0
        obj.put(key, value)
    }
    
    private func test02() {
    }
}
