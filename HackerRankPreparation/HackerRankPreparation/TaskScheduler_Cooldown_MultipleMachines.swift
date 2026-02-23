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

func calculateMinimumTimeUnits(tasks: [Int], m: Int, k: Int) -> Int {
    return -1
}
