//
//  firstNotRepeatingCharacter.swift
//  iOSSeniorDeveloper
//
//  Created by Sơn Đỗ on 07/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/uX5iLwhc6L5ckSyNC/description
class FirstNotRepeatingCharacter {
    static let shared = FirstNotRepeatingCharacter()
    private init() {}
    
    /// A string that contains only lowercase English letters
    /// 1 ≤ s.length ≤ 10^5
    ///
    /// s =  "abacabad"
    /// solution(s) = 'c'
    func solution(s: String) -> Character {
        var dict = [Character:Int]()
        
        for character in s { // String.Element == Character
            let currentValue = dict[character] ?? 0
            dict[character] = currentValue + 1
        }
                 
        for character in s {
            let currentValue = dict[character] ?? 0
            if currentValue == 1 {
                return character
            }
        }
        return "_"
    }
}

extension FirstNotRepeatingCharacter {
    func highestVoteSolution(s: String) -> Character {
        for char in s {
            if s.firstIndex(of: char) == s.lastIndex(of: char) {
                return char
            }
        }
        return "_"
    }
}
