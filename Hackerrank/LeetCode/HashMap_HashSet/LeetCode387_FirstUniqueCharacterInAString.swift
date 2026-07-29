//
//  LeetCode387_FirstUniqueCharacterInAString.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// template
class LeetCode387_FirstUniqueCharacterInAString {
    func firstUniqChar(_ s: String) -> Int {
        // preparation
        /*
        let z: Character = "z"
        let intZ = z.asciiValue! /// 122
        
        let count = Int(intZ - intA + 1)
        */
        let a: Character = "a"
        let intA = a.asciiValue! /// 97
        ///
        // freq
        var freq: [Int] = Array(repeating: 0, count: 26) /// 26
        
        for character in s {
            let index = Int(character.asciiValue! - intA)
            freq[index] += 1
        }
        
        // check
        for (i, character) in s.enumerated() {
            let index = Int(character.asciiValue! - intA)
            
            if freq[index] == 1 {
                return i
            }
        }
        return -1
    }
}

extension LeetCode387_FirstUniqueCharacterInAString {
    func demo() {
        test01()
        test02()
        test03()
    }
    
    private func test01() {
        let s = "leetcode"
        print(firstUniqChar(s)) /// 0
    }
    
    private func test02() {
        let s = "loveleetcode"
        print(firstUniqChar(s)) /// 2
    }
    
    private func test03() {
        let s = "aabb"
        print(firstUniqChar(s)) /// -1
    }
}
