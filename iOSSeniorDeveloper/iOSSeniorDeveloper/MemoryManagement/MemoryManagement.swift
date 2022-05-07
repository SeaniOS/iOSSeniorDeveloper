//
//  MemoryManagement.swift
//  iOSSeniorDeveloper
//
//  Created by Sơn Đỗ on 23/04/2022.
//

import Foundation

class MemoryManagement {
    private init() {}
    static let shared = MemoryManagement()
    
    func example() {
        var a: A? = A()
        var b: B? = B()
        a?.b = b
        b?.a = a
        
        a = nil
        b = nil
    }
}

class A {
   weak var b: B? = nil
   
   init() {
      print("init A")
   }
   deinit {
      print("deinit A")
   }
}
class B {
   weak var a: A? = nil
   
   init() {
      print("init B")
   }
   deinit {
      print("deinit B")
   }
}
