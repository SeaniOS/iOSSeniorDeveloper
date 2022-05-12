//
//  isCryptSolution.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 11/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/yM4uWYeQTHzYewW9H/description
class IsCryptSolution {
    static let shared = IsCryptSolution()
    private init() {}
    /*
    let crypt: [String] = ["SEND", "MORE", "MONEY"]
    let solution = [["O", "0"],
                    ["M", "1"],
                    ["Y", "2"],
                    ["E", "5"],
                    ["N", "6"],
                    ["D", "7"],
                    ["R", "8"],
                    ["S", "9"]]
     */
    func solution(crypt: [String], solution: [[Character]]) -> Bool {
        let solution = convertedSolution(solution)
        let result = crypt.compactMap { decrypt(crypt: $0, solution: solution) }
        guard result.count == 3 else { return false }
        return result[0] + result[1] == result[2]
    }
    
    private func decrypt(crypt: String, solution: [Character: String]) -> Int? {
        let decrypt = crypt.compactMap { solution[$0] }.joined(separator: "")
        guard let intValue = Int(decrypt) else { return nil }
        if intValue == 0, decrypt.count != 1 { return nil }
        if intValue != 0, decrypt.starts(with: "0") { return nil }
        return intValue
    }
    
    private func convertedSolution(_ solution: [[Character]]) -> [Character: String] {
        var dict = [Character: String]()
        solution.forEach { dict[$0[0]] = String($0[1]) }
        return dict
    }
}

extension IsCryptSolution {
    func highestVoteSolution(crypt: [String], solution: [[Character]]) -> Bool {
        var solutionDictionary = [Character : Character]()
        solution.forEach {s in solutionDictionary[s[0]] = s[1]}
        var result = true
        var cryptNumbers = [Int]()
        
        crypt.map{$0.map{$0}}
            .map({ word in
                var transform: [Character] = word
                for i in 0..<word.count {
                    transform[i] = solutionDictionary[word[i]]!
                }
                if transform.count > 1 && transform.first! == "0" {result = false}
                return Int(String(transform))!
            }).forEach {
                cryptNumbers.append($0)
            }
        
        print(cryptNumbers)
        return result ? (cryptNumbers[0] + cryptNumbers[1] == cryptNumbers[2]) : false
        
        /*
        // crypt: [String]
        let aa = crypt.map { $0 } // [String]
        let bb = crypt.map { $0.map{$0} } [[Character]]
         */
    }
}
