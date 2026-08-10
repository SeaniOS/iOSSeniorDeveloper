//
//  20_ValidParentheses.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 24/3/26.
//

import Foundation

class Stack_20_ValidParentheses {
    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
        
        for c in s {
            // print(c)
            if c == "(" || c == "[" || c == "{" {
                stack.push(c)
            } else {
                // ), ], }
                if stack.isEmpty {
                    return false
                }
                
                if c == ")" && stack.pop() != "(" {
                    return false
                }
                
                if c == "]" && stack.pop() != "[" {
                    return false
                }
                
                if c == "}" && stack.pop() != "{" {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

extension Stack_20_ValidParentheses {
    func test() {
        let s = "()"
        let result = isValid(s)
        print(result)
    }
}
/*
Example 1:

Input: s = "()"

Output: true
*/
