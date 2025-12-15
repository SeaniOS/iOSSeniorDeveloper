//
//  ConcurrencyLearning.swift
//  iOSSeniorDeveloper
//
//  Created by DO HOANG SON on 15/12/25.
//

import Foundation

class ConcurrencyLearning {
    private init() {}
    static let shared = ConcurrencyLearning()
    
    func demo() {
        Task {
            await demoActor()
        }
    }
}

// MARK: - Actor
extension ConcurrencyLearning {
    func demoActor() async {
        /*
        print("⚡️ demoActor")
        let user = User()
        await user.login()
        print("⚡️ after login")
        
        try? await Task.sleep(for: .seconds(0.5))
        print("⚡️ after sleep")
        */
        
        print("⚡️ demoActor")
        let user = UserWithDetached()
        await user.login()
        print("⚡️ after login")
        
        try? await Task.sleep(for: .seconds(0.5))
        print("⚡️ after sleep")
    }
    
    /// When you create a regular task from inside an actor it will be isolated to that actor,
    /// which means you can use other parts of the actor synchronously
    private actor User {
        func authenticate(user: String, password: String) -> Bool {
            // Complicated logic here
            return true
        }

        func login() {
            Task {
                if authenticate(user: "taytay89", password: "n3wy0rk") {
                    print("Successfully logged in.")
                } else {
                    print("Sorry, something went wrong.")
                }
            }
        }
    }
    
    actor UserWithDetached {
        func login() {
            Task.detached {
                if await self.authenticate(user: "taytay89", password: "n3wy0rk") {
                    print("Successfully logged in.")
                } else {
                    print("Sorry, something went wrong.")
                }
            }
        }

        func authenticate(user: String, password: String) -> Bool {
            // Complicated logic here
            return true
        }
    }

}

// MARK: - Task
extension ConcurrencyLearning {
    func demoTask() {
        print("⚡️ demoConcurrency")
        Task {
            do {
                let result = try await asyncFuncWithResult()
                print("⚡️ result: \(result)")
            } catch {
                print("⚡️ error: \(error)")
            }
        }
        print("⚡️ an action beneath Task") // thread is not blocked: demoConcurrency -> an action beneath Task -> result: 1
    }
    
    private func asyncFuncWithResult() async throws -> Int {
        try await Task.sleep(for: .seconds(2))
        return 1
    }
}
