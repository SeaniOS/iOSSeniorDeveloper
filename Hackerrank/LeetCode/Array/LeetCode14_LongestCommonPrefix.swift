//
//  LeetCode14_LongestCommonPrefix.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 20/7/26.
//

import Foundation

/// string process
class LeetCode14_LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count >= 1 else { return "" }
        let prefix = strs[0]
        
        for (index, character) in prefix.enumerated() { // loop through each character
            // print(character) // f l o w e r
            for i in 1..<strs.count { // loop through array of strings, from the second string
                let str = strs[i] // each string // "flow"
                
                guard str.count > index else { return subString(str: prefix, intIndex: index) }
                
                let characterAtIndex = characterAtIndex(str: str, index: index)
                guard character == characterAtIndex else { return subString(str: prefix, intIndex: index) }
            }
        }

        return prefix
    }
    
    private func characterAtIndex(str: String, index: Int) -> Character {
        let characterAtIndex = str[str.index(str.startIndex, offsetBy: index)]
        return characterAtIndex
    }
    
    private func subString(str: String, intIndex: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: intIndex)
        return String(str[..<index])
    }
}

extension LeetCode14_LongestCommonPrefix {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        let strs = ["flower","flow","flight"]
        let output = longestCommonPrefix(strs)
        print(output) // fl
    }
    
    private func test02() {
        let strs = ["dog","racecar","car"]
        let output = longestCommonPrefix(strs)
        print(output) // ""
    }
}
