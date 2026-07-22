//
//  LeetCode344_ReverseString.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// two pointers
class LeetCode344_ReverseString {
    func reverseString(_ s: inout [Character]) {
        var i = 0
        var j = s.count - 1
        
        while (i < j) {
            // swap
            let temp = s[i]
            s[i] = s[j]
            s[j] = temp
            
            i += 1
            j -= 1
        }
    }
}

extension LeetCode344_ReverseString {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        var s: [Character] = ["h","e","l","l","o"]
        reverseString(&s)
        print(s) // ["o","l","l","e","h"]
    }
    
    private func test02() {
        var s: [Character] = ["H","a","n","n","a","h"]
        reverseString(&s)
        print(s) // ["h","a","n","n","a","H"]
    }
}
