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
}

extension LearningSendable {
    /*
    func demoPrintScore() {
        Task {
            // Passing closure as a 'sending' parameter risks causing data races between code in the current task and concurrent execution of the closure
            await printScore()
        }
    }
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
}

extension LearningSendable {
    func demoRunLater() {
        let counter = Counter()

        myPrint("Start")

        // runLater { @Sendable in
            // This is safe because we're calling an actor-isolated method
            Task {
                await counter.increment()
                // counter.increment() // Expression is 'async' but is not marked with 'await'
            }
            
            Task {
                await counter.decrement()
            }
        // }

        myPrint("End — waiting 3 seconds...")
    }
    
    private actor Counter { // actor: async
        private(set) var value = 0
        
        func increment() {
            value += 1
            myPrint("Counter incremented to \(value)")
        }
        
        func decrement() {
            value -= 1
            myPrint("Counter decremented to \(value)")
        }
    }
    
    private func runLater(_ function: @escaping @Sendable () -> Void) -> Void { // enforce similar rules around captured values
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: function)
    }
}

