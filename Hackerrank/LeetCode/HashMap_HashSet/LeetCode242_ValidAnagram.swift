//
//  LeetCode242_ValidAnagram.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// template
class LeetCode242_ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        let aChar: Character = "a"
        var array = Array(repeating: 0, count: 26)
        
        for char in s {
            let index = char.asciiValue! - aChar.asciiValue!
            array[Int(index)] += 1
        }
        
        for char in t {
            let index = char.asciiValue! - aChar.asciiValue!
            
            if array[Int(index)] == 0 {
                return false
            }
            array[Int(index)] -= 1
        }
        return true
    }
}

extension LeetCode242_ValidAnagram {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        let s = "anagram"
        let t = "nagaram"
        let result = isAnagram(s, t)
        print(result) // true
    }
    
    private func test02() {
        let s = "rat"
        let t = "car"
        let result = isAnagram(s, t)
        print(result) // false
    }
}
