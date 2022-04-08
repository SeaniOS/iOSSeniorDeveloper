//
//  StateView.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import SwiftUI

class StateClass { // struct
    var number: Int = 0
}

// A property wrapper type that can read and write a value managed by SwiftUI
struct StateView: View {
    @State var object = StateClass()
    
    var body: some View {
        VStack {
            Text("number: \(object.number)")
            Button("increment number") {
                object.number += 1
                print("number: \(object.number)")
            }
        }
    }
    
    /*
    @State var number = 0
    
    var body: some View {
        Text("number: \(number)")
        Button("increment number") {
            number += 1
        }
    }
     */
}


