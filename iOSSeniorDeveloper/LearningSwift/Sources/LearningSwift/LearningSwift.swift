// The Swift Programming Language
// https://docs.swift.org/swift-book

public func demoLearningSwift() {
    myPrint("demoLearningSwift")
    
    let learningSendable = LearningSendable()
    
    Task {
        await learningSendable.printScore()
    }
    
    
}

func myPrint(_ items: Any...) {
    for item in items {
        print("⚡️ \(item)")
    }
}
