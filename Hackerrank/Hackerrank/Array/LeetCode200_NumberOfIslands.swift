//
//  LeetCode200_NumberOfIslands.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 17/7/26.
//

import Foundation

class LeetCode200_NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count),
                            count: grid.count)
        
        for m in 0..<grid.count { // 0..1..2..3
            for n in 0..<grid[0].count { // 0..1..2..3..4..5
                let value = grid[m][n]
                if value == "1" && !visited[m][n] {
                    count += 1
                    // process the current Island
                    processIsland(grid, m: m, n: n, visited: &visited)
                } else {
                    continue
                }
            }
        }
        return count
    }
    
    private func processIsland(_ grid: [[Character]], m: Int, n: Int, visited: inout [[Bool]]) {
        if m < 0 || m >= grid.count || n < 0 || n >= grid[0].count { return }
        if grid[m][n] == "0" || visited[m][n] { return }
        
        visited[m][n] = true
        
        processIsland(grid, m: m - 1, n: n, visited: &visited)
        processIsland(grid, m: m + 1, n: n, visited: &visited)
        processIsland(grid, m: m, n: n - 1, visited: &visited)
        processIsland(grid, m: m, n: n + 1, visited: &visited)
    }
}

extension LeetCode200_NumberOfIslands {
    func demo() {
        test01()
        test02()
    }
    
    private func test01() {
        let grid: [[Character]] = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ]
        let output = numIslands(grid)
        print(output)
    }
    
    private func test02() {
        let grid: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ]
        let output = numIslands(grid)
        print(output)
    }
}
