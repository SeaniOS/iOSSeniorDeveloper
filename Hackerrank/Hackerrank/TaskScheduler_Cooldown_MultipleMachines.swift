//
//  TaskScheduler_Cooldown_MultipleMachines.swift
//  HackerRankPreparation
//
//  Created by DO HOANG SON on 23/2/26.
//

import Foundation

/*
 Task Scheduler with Cooldown and Multiple Machines
 
 Given an array tasks and m machines, find the minimum time to complete all tasks.
 Each time unit can process up to m tasks in parallel.
 A machine cannot process the same task type again for k time units.
 
 Examples
 Example 1 💡
 
 Input:
 tasks = [1, 1, 2, 1]
 m = 2
 k = 2
 
 Output:
 3
 
 Explanation:
 We have 4 tasks: [1,1,2,1] and 2 machines with cooldown k=2.
 Time unit 1: schedule type 1 on both machines → remaining [2,1].
 Time unit 2: neither machine can run type 1 (cooldown until time 3), so we run task 2 on one machine; the other is idle → remaining [1].
 Time unit 3: cooldown for type 1 has passed on at least one machine, so we schedule the last task 1. Total time = 3.
 
 Example 2 💡
 
 Input:
 tasks = [1, 1, 1, 2, 2, 3]
 m = 3
 k = 2
 
 Output:
 2
 
 Explanation:
 We have 6 tasks and 3 machines, k=2.
 Time unit 1: schedule three tasks of type 1 in parallel → remaining [2,2,3].
 Time unit 2: all machines are free to run types 2, 2, and 3 (none violate cooldown) → remaining [].
 All tasks complete in 2 time units.
 */

class Machine {
    var cooldownInfo: Dictionary<Int, Int> = [:] // task type: available unit
}

struct TaskInfo: Comparable {
    var task: Int
    var remainingCount: Int
    
    static func < (lhs: TaskInfo, rhs: TaskInfo) -> Bool {
        return lhs.remainingCount < rhs.remainingCount
    }
}

class TaskScheduler_Cooldown_MultipleMachines {
    private func _calculateMinimumTimeUnits(tasks: [Int], m: Int, k: Int) -> Int {
        // preparation
        var tasks = tasks // to be mutable
        var timeUnit = 0 // init timeUnit
        
        // preparation for machine
        var machines: [Machine] = []
        for _ in 0..<m {
            let machine = Machine()
            machines.append(machine)
        }
        
        // while
        while !tasks.isEmpty { // loop until there is no tasks remaining
            // loop through machine
            for machine in machines {
                // loop through task: find appropriate task for machine
                for index in 0..<tasks.count {
                    let task = tasks[index]
                    
                    let cooldownInfo = machine.cooldownInfo[task] ?? -1
                    if cooldownInfo <= timeUnit {
                        machine.cooldownInfo[task] = timeUnit + k
                        tasks.remove(at: index)
                        break
                    }
                }
            }

            timeUnit += 1 // increase timeUnit
        }
        return timeUnit
    }
}

extension TaskScheduler_Cooldown_MultipleMachines {
    private func __calculateMinimumTimeUnits(tasks: [Int], m: Int, k: Int) -> Int {
        // frequentDict
        var frequentDict: [Int: Int] = [:]
        for task in tasks {
            // frequentDict[task] = (frequentDict[task] ?? 0) + 1
            frequentDict[task, default: 0] += 1
        }
        // print("frequentDic: \(frequentDict)")
        
        // maxHeap ~ sortedArray
        var maxHeap: [(Int, Int)] = []
        for (key, value) in frequentDict {
            maxHeap.append((key, value))
        }
        
        maxHeap = maxHeap.sorted { $0.1 > $1.1 } // (taskType, remainingCount)
        // print(maxHeap)
        
        // machines
        var machines: [Machine] = []
        for _ in 0..<m {
            let machine = Machine()
            machines.append(machine)
        }
        
        // process
        var timeUnit = 0
        
        while !maxHeap.isEmpty {
            for machine in machines {
                // assign task for machine
                for index in 0..<maxHeap.count {
                    let taskInfo = maxHeap[index]
                    let (task, remainingCount) = taskInfo
                    
                    let cooldownInfo = machine.cooldownInfo[task] ?? 0
                    
                    if cooldownInfo <= timeUnit {
                        machine.cooldownInfo[task] = timeUnit + k
                        
                        if remainingCount == 1 {
                            maxHeap.remove(at: index)
                        } else {
                            maxHeap[index].1 -= 1 // remainingCount - 1
                        }
                        break
                    }
                }
            }

            timeUnit += 1 // increase timeUnit
        }
        return timeUnit
    }
}

extension TaskScheduler_Cooldown_MultipleMachines {
    private func calculateMinimumTimeUnits(tasks: [Int], m: Int, k: Int) -> Int {
        // frequentDict
        var frequentDict: [Int: Int] = [:]
        for task in tasks {
            frequentDict[task, default: 0] += 1
        }
        
        // maxHeap
        var maxHeap = MaxHeap<TaskInfo>()
        for (key, value) in frequentDict {
            maxHeap.push(.init(task: key, remainingCount: value))
        }
        
        // machines
        var machines: [Machine] = []
        for _ in 0..<m {
            let machine = Machine()
            machines.append(machine)
        }
        
        // process
        var timeUnit = 0
        
        while !maxHeap.isEmpty {
            for machine in machines {
                // assign task for machine
                /*
                for index in 0..<maxHeap.count {
                    let taskInfo = maxHeap[index]
                    let (task, remainingCount) = taskInfo
                    
                    let cooldownInfo = machine.cooldownInfo[task] ?? 0
                    
                    if cooldownInfo <= timeUnit {
                        machine.cooldownInfo[task] = timeUnit + k
                        
                        if remainingCount == 1 {
                            maxHeap.remove(at: index)
                        } else {
                            maxHeap[index].1 -= 1 // remainingCount - 1
                        }
                        break
                    }
                }
                */
            }

            timeUnit += 1 // increase timeUnit
        }
        return timeUnit
    }
}

extension TaskScheduler_Cooldown_MultipleMachines {
    func demo() {
        demoFirst()
        demoSecond()
    }
    
    private func demoFirst() {
        let tasks = [1, 1, 2, 1]
        let m = 2
        let k = 2
        
        let output = calculateMinimumTimeUnits(tasks: tasks, m: m, k: k)
        print("demoFirst.output: \(output)") // 3
    }
    
    private func demoSecond() {
        let tasks = [1, 1, 1, 2, 2, 3]
        let m = 3
        let k = 2
        let output = calculateMinimumTimeUnits(tasks: tasks, m: m, k: k)
        print("demoSecond.output: \(output)") // 2
    }
}

struct MaxHeap<T: Comparable> {
    private var heap: [T] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: T? {
        heap.first
    }
    
    // Insert
    mutating func push(_ value: T) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    // Remove max
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeLast() }
        
        heap.swapAt(0, heap.count - 1)
        let max = heap.removeLast()
        siftDown(from: 0)
        return max
    }
    
    // MARK: - Heap helpers
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent
            
            if left < heap.count && heap[left] > heap[candidate] {
                candidate = left
            }
            if right < heap.count && heap[right] > heap[candidate] {
                candidate = right
            }
            if candidate == parent { return }
            
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}


