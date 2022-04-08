//
//  EnvironmentObject.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import Foundation
import SwiftUI

struct EnvironmentObjectView: View {
    
    @EnvironmentObject var object: StateObjectClass

    var body: some View {
        Text("number: \(object.number)")
        Button("increment number") {
            object.number += 1
            print("number: \(object.number)")
        }
    }
}


struct EStateObjectView: View {
    @StateObject var object = StateObjectClass()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("number: \(object.number)")
                Button("increment number") {
                    object.number += 1
                    print("number: \(object.number)")
                }
                
                NavigationLink(destination: EnvironmentObjectView()) {
                    Text("To EnvironmentObjectView")
                }
            }
        }
        .environmentObject(object)
    }
}

