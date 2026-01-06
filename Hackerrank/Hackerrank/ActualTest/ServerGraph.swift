//
//  ServerGraph.swift
//  Hackerrank
//
//  Created by DO HOANG SON on 5/1/26.
//

import Foundation

class ServerGraph {
    func demo() {
        let output = countOddSumAssignments(serverNodes: 3, serverFrom: [0, 1], serverTo: [1, 2])
        print(output) // 6
    }
    /*
     0 — 1 — 2 undirected graph
     
     1, 2, 1
     1, 2, 3
     
     3, 2, 3
     3, 2, 1
     
     2, 1, 2
     2, 3, 2
     */
    private func countOddSumAssignments(serverNodes: Int,
                                        serverFrom: [Int],
                                        serverTo: [Int]
    ) -> Int {
        
        // 1️⃣ Build adjacency list
        // Each edge is added 2 sides because of undirected graph 
        var graph = Array(repeating: [Int](), count: serverNodes)
        for i in 0..<serverFrom.count { // 0 1
            let u = serverFrom[i] // 0 // 1
            let v = serverTo[i] // 1 // 2
            graph[u].append(v)
            graph[v].append(u)
        }
        print("graph: \(graph)")
        /*
         graph:
         [
         [1], // 0
         [0, 2], // 1
         [1] // 2
         ]
         */
        
        // -1 = not visited, 0 = color A, 1 = color B
        var color = Array(repeating: -1, count: serverNodes) // ~ 2-coloring graph
        
        var result = 1
        
        // 2️⃣ interate through each connected component
        for start in 0..<serverNodes {
            if color[start] != -1 { continue } // visited -> continue
            
            // BFS // why not DFS? -> DFS is still okay
            var queue = [start]  // queue = [0]
            color[start] = 0 // color[0] = 0
            
            var countA = 1 // node 0
            var countB = 0
            
            var index = 0
            while index < queue.count { // 0 < 1
                let u = queue[index] // u = 0
                index += 1 // no dequeue but increase index
                
                for v in graph[u] { // neighbors = [1]
                    if color[v] == -1 { // Node 1 not visited
                        color[v] = 1 - color[u]
                        if color[v] == 0 {
                            countA += 1
                        } else {
                            countB += 1
                        }
                        queue.append(v) // no dequeue?
                    } else if color[v] == color[u] {
                        // ❌ No bipartite
                        return 0
                    }
                }
            }
            
            // 3️⃣ Apply formula for this component
            let ways =
            pow2(countA) * 1 +
            pow2(countB) * 1
            
            // In fact:
            // (odd^A * even^B) + (even^A * odd^B)
            // = 2^A * 1^B + 1^A * 2^B
            
            result *= ways
        }
        
        return result
    }
    
    private func pow2(_ n: Int) -> Int {
        return Int(pow(2.0, Double(n)))
    }
}

/*
 Lần 1
 u = 0
 neighbors = [1]
 
 Node 1 chưa thăm:
 color[1] = 1
 countB = 1
 queue = [0, 1]
 
 Lần 2
 u = 1
 neighbors = [0, 2]
 
 color[2] = 0
 countA = 2
 queue = [0, 1, 2]
 
 u = 2
 neighbors = [1]
 
 */
