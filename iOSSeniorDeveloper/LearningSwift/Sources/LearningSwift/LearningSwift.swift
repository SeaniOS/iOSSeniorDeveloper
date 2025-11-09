// The Swift Programming Language
// https://docs.swift.org/swift-book

public func demoLearningSwift() {
    myPrint("demoLearningSwift")
    
    let learningSendable = LearningSendable()
    /*
    Task {
        // Sending value of non-Sendable type '() async -> ()' risks causing data races
        await learningSendable.printScore()
    }
    */
    learningSendable.demoRunLater()
}

func myPrint(_ items: Any...) {
    for item in items {
        print("⚡️ \(item)")
    }
}
