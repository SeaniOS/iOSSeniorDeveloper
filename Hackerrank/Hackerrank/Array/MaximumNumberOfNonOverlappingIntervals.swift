//
//  MaximumNumberOfNonOverlappingIntervals.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 30/12/25.
//

import Foundation

class MaximumNumberOfNonOverlappingIntervals {
    func demo() {
        let meetings = [[1, 2], [2, 3], [3, 4], [1, 3]]
        let output = maximizeNonOverlappingMeetings(meetings: meetings)
        print(output)
    }
    
    /*
     Explanation:

     Step 1: Sort meetings by end time → [[1,2],[2,3],[1,3],[3,4]].
     Step 2: Select [1,2] (count=1, last_end=2).
     Step 3: [2,3] has start 2 ≥ 2, select (count=2, last_end=3).
     Step 4: [1,3] start 1 < 3, skip.
     Step 5: [3,4] start 3 ≥ 3, select (count=3). Result = 3.
     */
    
    private func maximizeNonOverlappingMeetings(meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { firstMeeting, secondMeeting in
            firstMeeting[1] < secondMeeting[1]
        }
        
        var count = 1
        var last_end = sortedMeetings[0][1] // 2
        
        if sortedMeetings.count == 1 {
            return count
        }
        
        for i in 1 ..< sortedMeetings.count {
            let meeting = sortedMeetings[i]
            let start = meeting[0]
            if start >= last_end {
                count += 1
                last_end = meeting[1]
            }
        }
        return count
    }
}
