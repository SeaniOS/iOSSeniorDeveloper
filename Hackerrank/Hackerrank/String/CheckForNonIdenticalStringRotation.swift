//
//  CheckForNonIdenticalStringRotation.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 29/12/25.
//

import Foundation

/*
 - s2 ('cdeab') is a non-trivial rotation of s1 ('abcde').
 - If you rotate 'abcde' left by 2 positions, you get 'cdeab'.
 - Since s2 is not equal to s1 and is a rotation, the output is true.
 */

class CheckForNonIdenticalStringRotation {
    func demo() {
        let result = isNonTrivialRotation(s1: "abcde", s2: "cdeab")
        print(result)
    }
    
    private func isNonTrivialRotation(s1: String, s2: String) -> Bool {
        if s1 == s2 { return false }
        
        var currentString = s1
        let count = currentString.count
        var index = 0
        
        while index < count - 1 { // rotate left n-1 time
            let firstCharacter = currentString.remove(at: currentString.startIndex)
            currentString.insert(firstCharacter, at: currentString.endIndex)
            
            if currentString == s2 {
                return true
            }
            index += 1
        }
        return false
    }
}
