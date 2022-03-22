//
//  ViewController.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 17/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testDispatchGroup()
    }
}

extension ViewController {
    private func testQueue() {
        // custom concurrentQueue
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", qos: .default, attributes: .concurrent)
        concurrentQueue.async {
            for _ in 1...3 {
                print("concurrentQueue 1")
            }
        }
        
        concurrentQueue.async {
            for _ in 1...3 {
                print("concurrentQueue 2")
            }
        }
        
        // custom serialQueue
        let serialQueue = DispatchQueue(label: "serialQueue")
        serialQueue.async {
            for _ in 1...3 {
                print("serialQueue 1")
            }
        }
        
        serialQueue.async {
            for _ in 1...3 {
                print("serialQueue 2")
            }
        }
        
        // main queue: serial queue
        let queue = DispatchQueue(label: "queue", qos: .default)
        queue.async {
            var total = 0
            for index in 1...100 {
                total += index
            }
            
            DispatchQueue.main.async {
                print("update UI \(total)")
            }
        }
        
        // global queue: concurrentQueue queue
        // User-interactive, User-initiated, Default, Utility và Background
        DispatchQueue.global(qos: .userInteractive).async {
            // do somethings here!
        }
    }
    
    private func testConcurrentQueueWithSyncAsync() {
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        queue.sync { // block
            for _ in 1...100 {
                print("thread 1")
            }
        }

        queue.async {
            for _ in 1...100 {
                print("thread 2")
            }
        }
    }
    
    private func testDelay() {
        let deadline = DispatchTime.now() + .seconds(5)

        print("start do task")
        let startTime = Date()

        DispatchQueue.main.asyncAfter(deadline: deadline) {
            let delayTime = Date().timeIntervalSince(startTime)
            print("finish task with delay time \(Int(delayTime))")
        }
    }
    
    private func testDispatchWorkItem() {
        var workItem: DispatchWorkItem!
        
        // Cancel
        workItem = DispatchWorkItem {
            let startTime = Date()
            if !workItem.isCancelled {
                print("start working") // 1
            }
            sleep(3)
            if workItem.isCancelled {
                print("work is cancelled") // 3
                return
            }
            print("finish work") // 4
            
            let delayTime = Date().timeIntervalSince(startTime)
            print("finish task with delay time \(Int(delayTime))")
        }
        
        // Notify when finish
        workItem.notify(queue: DispatchQueue.main) {
            print("workItem is notify")
        }

        // workItem.perform()
        DispatchQueue.main.async(execute: workItem) // main Queue

        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 1) { // global queue
            print("cancel work") // 2
            workItem.cancel()
        }
        // nếu cancel được gọi trước khi DispatchWorkItem thì mọi dòng lênh trong DispatchWorkItem sẽ không được thực thi nữa
    }
    
    private func testDispatchGroup() {
        let group = DispatchGroup()
        // (1) async(group: group, execute: task1)
        let task1 = DispatchWorkItem {
            sleep(2)
            print("task1 is finish")
        }
        DispatchQueue(label: "queue1").async(group: group, execute: task1)

        // (2) group.enter() & group.leave()
        /*
        let task2 = DispatchWorkItem {
            sleep(1)
            print("task2 is finish")
        }
        */
        DispatchQueue(label: "queue2").async {
            group.enter()
            sleep(1)
            print("task2 is finish")
            group.leave()
        }
        
        // (3) notify
        group.notify(queue: DispatchQueue.main) {
            print("group is done")
        }
    }
}

