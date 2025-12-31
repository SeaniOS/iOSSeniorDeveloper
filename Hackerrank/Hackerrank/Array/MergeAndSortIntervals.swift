//
//  MergeAndSortIntervals.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 31/12/25.
//

import Foundation

class MergeAndSortIntervals {
    func demo() {
        let intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
        let result = mergeHighDefinitionIntervals(intervals: intervals)
        print(result) // [[1, 6], [8, 10], [15, 18]]
    }
    
    private func mergeHighDefinitionIntervals(intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted { lhs, rhs in
            lhs[0] < rhs[0]
        }
        
        var result = [[Int]]()
        var index = 1
        
        if sortedIntervals.count == 0 {
            return result
        }
        
        var mergedItem = sortedIntervals[0]
        if sortedIntervals.count == 1 {
            return [mergedItem]
        }
        
        while index < sortedIntervals.count {
            let interval = sortedIntervals[index]
            
            if interval[0] <= mergedItem[1] { // overlap
                let startInterval = mergedItem[0]
                let endInterval = max(mergedItem[1], interval[1])
                
                mergedItem = [startInterval, endInterval]
            } else {
                result.append(mergedItem)
                mergedItem = interval
            }
            
            index = index + 1
        }
        
        result.append(mergedItem) // append last mergedItem whether overlapping or not
        return result
    }
}
