//
//  sudoku2.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 10/05/2022.
//

import Foundation

// https://app.codesignal.com/interview-practice/task/SKZ45AF99NpbnvgTn/description
class Sudoku2 {
    static let shared = Sudoku2()
    private init() {}
    
    func solution(grid: [[Character]]) -> Bool {
        // row
        for i in 0..<grid.count {
            let row = grid[i]
            
            if !isValidSubgrid(row) {
                return false
            }
        }
        // column: grid[0][0] grid[1][0] ...
        for i in 0..<grid.count {
            var column = [Character]()
            
            for j in 0..<grid.count {
                let value = grid[j][i]
                column.append(value)
            }
            
            if !isValidSubgrid(column) {
                return false
            }
        }
        
        /* subgrid: grid[0][0] grid[0][1] grid[0][2]
                    grid[1][0] grid[1][1] grid[1][2]
                    grid[2][0] grid[2][2] grid[2][2]
         */
        for i in stride(from: 0, through: grid.count-1, by: 3) {
            for j in stride(from: 0, through: grid.count-1, by: 3) {
                let subgrid: [Character] = [grid[j][i], grid[j][i+1], grid[j][i+2],
                                            grid[j+1][i], grid[j+1][i+1], grid[j+1][i+2],
                                            grid[j+2][i], grid[j+2][i+1], grid[j+2][i+2]]
                if !isValidSubgrid(subgrid) {
                    return false
                }
            }
        }
        return true
    }
    
    private func isValidSubgrid(_ subgrid: [Character]) -> Bool {
        var set = Set<Character>()
        for character in subgrid where character != "." {
            if set.contains(character) {
                return false
            }
            set.insert(character)
        }
        
        return true
    }
}

extension Sudoku2 {
    func highestVoteSolution(grid: [[Character]]) -> Bool {
        
        var seen = Set<String>()
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if grid[i][j] != "." {
                    let value = String(grid[i][j])
                    
                    let row = "row \(i): \(value)"
                    let col = "col \(j): \(value)"
                    let sub = "sub \(i/3)|\(j/3): \(value)"
                    
               
                    if seen.contains(row) || seen.contains(col) || seen.contains(sub) {
                        return false
                    }
                    else {
                        seen.insert(row)
                        seen.insert(col)
                        seen.insert(sub)
                    }
                }
            }
        }
        
        return true
    }
}
