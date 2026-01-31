//
//  MaxUniqueSubstringLengthInASession.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 30/1/26.
//

import Foundation

/*
 Max Unique Substring Length in a Session
 Given a string of lowercase letters with sessions separated by '' characters, find the maximum length of a substring with all distinct letters within any single session.
 
 Example
 - Input
 sessionString = abcabcbb
- Output
 3
 
 Explanation
 - There is only one session: "abcabcbb".
 - Scanning with a sliding window for distinct letters, the longest substrings without repeats are "abc", "bca" and so on, each of length 3.
 - Therefore, the result is 3.
 
 Sample Input 0
 *
 Sample Output 0
 0
 
 Sample Input 1
 aa
 Sample Output 1
 1
 */

class MaxUniqueSubstringLengthInASession {
    func maxDistinctSubstringLengthInSessions(sessionString: String) -> Int {
        var maximumLength = 0
        var left = 0
        var characters = Array(sessionString) /// convert to array
        var lastSeen = [Character: Int]() /// using lastSeen
        
        for right in 0..<sessionString.count { /// make sure O(n)
            let character = characters[right]
            
            if character == "*" {
                left = right + 1
                lastSeen.removeAll()
                continue
            }
            
            if let lastIndex = lastSeen[character], lastIndex >= left {
                /// why lastIndex >= left? left should be only increased
                left = lastIndex + 1 /// jump
            }
            
            lastSeen[character] = right
            maximumLength = max(maximumLength, right - left + 1)
        }
        return maximumLength
    }
}
