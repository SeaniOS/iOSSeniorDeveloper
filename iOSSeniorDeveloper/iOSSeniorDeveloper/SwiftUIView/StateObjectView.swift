//
//  StateObjectView.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import SwiftUI

class StateObjectClass: ObservableObject {
   @Published var number: Int = 0
}

// A property wrapper type that instantiates an observable object.
struct StateObjectView: View {
    @StateObject var object = StateObjectClass()
    
    var body: some View {
        VStack {
            Text("number: \(object.number)")
            Button("increment number") {
                object.number += 1
                print("number: \(object.number)")
            }
        }
    }
}
