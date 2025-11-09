//
//  LearningSendable.swift
//  LearningSwift
//
//  Created by DO HOANG SON on 9/11/25.
//

import Foundation

class LearningSendable {
    /*
     private init() {}
     static var shared = LearningSendable()
     // nonisolated(unsafe) // @MainActor
     */
    
    func printScore() async {
        let score = 1
        
        Task {
            // score += 1 // Sending value of non-Sendable type '() async -> ()' risks causing data races
            myPrint(score)
        }
        Task {
            // score -= 1
            myPrint(score)
        }
    }
    /*
    func runLater(_ function: @escaping @Sendable () -> Void) -> Void { // enforce similar rules around captured values
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: function)
    }
     */
}

