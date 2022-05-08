//
//  rotateImage.swift
//  iOSSeniorDeveloper
//
//  Created by Sơn Đỗ on 08/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/5A8jwLGcEpTPyyjTB/description
class RotateImage {
    static let shared = RotateImage()
    private init() {}
    
    /*
    a = [[1, 2, 3],
         [4, 5, 6],
         [7, 8, 9]]
    
    solution(a) =
        [[7, 4, 1],
         [8, 5, 2],
         [9, 6, 3]]
     */
    func solution(a: [[Int]]) -> [[Int]] {
        /*
        a[0][0] = a[2][0]
        a[0][1] = a[1][0]
        a[0][2] = a[0][0]
         
        a[1][0] = a[2][1]
        a[1][1] = a[1][1]
        a[1][2] = a[0][1]
        
        ...
        */
        var output = a
        for i in 0..<a.count {
            for j in 0..<a.count {
                output[i][j] = a[a.count-1-j][i]
            }
        }
        myPrint(output)
        return output
    }
}

