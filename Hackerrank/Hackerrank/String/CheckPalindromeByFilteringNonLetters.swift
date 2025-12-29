//
//  CheckPalindromeByFilteringNonLetters.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 28/12/25.
//

import Foundation

class CheckPalindromeByFilteringNonLetters {
    func demo() {
        let code = "abc123cba"
        let output = isAlphabeticPalindrome(code: code)
        print(output)
    }
}

extension CheckPalindromeByFilteringNonLetters {
    private func isAlphabeticPalindrome(code: String) -> Bool {
        let letters = code.compactMap { character -> Character? in
            if isLetter(character: character) {
                return character
            } else {
                return nil
            }
        }
        
        let lowercasedLetters = String(letters).lowercased()
        let reversedLetters = String(lowercasedLetters.reversed())
        return lowercasedLetters == reversedLetters
    }
    
    private func isLetter(character: Character) -> Bool {
        // using forced unwrapping because of Constraints: 33 <= ASCII(code[i]) <= 126
        let asciiValue = character.asciiValue!
        
        let withinAZ = (Character("A").asciiValue! <= asciiValue) && (asciiValue <= Character("Z").asciiValue!)
        let withinaz = (Character("a").asciiValue! <= asciiValue) && (asciiValue <= Character("z").asciiValue!)
        
        return withinAZ || withinaz
    }
}
