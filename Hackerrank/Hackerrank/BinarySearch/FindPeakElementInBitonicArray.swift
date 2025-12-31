//
//  FindPeakElementInBitonicArray.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 31/12/25.
//

import Foundation

class FindPeakElementInBitonicArray {
    func demo() {
        let counts = [1, 3, 5, 4, 2]
        let output = findPeakIndex(counts: counts)
        print(output) // 2
    }
    
    private func findPeakIndex(counts: [Int]) -> Int {
        var low = 0
        var high = counts.count - 1
        var mid = 0
        
        while low <= high {
            mid = low + (high - low) / 2
            // print("low: \(low)")
            // print("high: \(high)")
            // print("mid: \(mid)")
            
            if counts[mid] > counts[mid+1] && counts[mid] > counts[mid-1] {
                return mid
            }
            
            if counts[mid] > counts[mid+1] {
                high = mid - 1 // on the descending side
            } else {
                low = mid + 1 // on the ascending side
            }
        }
        return mid
    }
}
