//
//  MainView.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        /*
         StateView()
         StateObjectView()
         ObservedObjectView()
         AdvancedStateObjectView()
         Warning01StateObjectView()
         Warning02StateObjectView()
         */
        
        EStateObjectView()
    }
}

struct Warning02StateObjectView: View {
    @StateObject var object = StateObjectClass()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("number: \(object.number)")
                Button("increment number") {
                    object.number += 1
                    print("number: \(object.number)")
                }

                NavigationLink(destination: Warning02ObservedObjectView()) {
                    Text("To ObservedObjectView")
                }
            }
        }
    }
}

struct Warning02ObservedObjectView: View {
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
/*
struct Warning01StateObjectView: View {
    @StateObject var object = StateObjectClass()
    
    var body: some View {
        VStack {
            Text("number: \(object.number)")
            Button("increment number") {
                object.number += 1
                print("number: \(object.number)")
            }
            
            Warning01ObservedObjectView()
        }
    }
}

struct Warning01ObservedObjectView: View {
    @ObservedObject var object = StateObjectClass()
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
 */
/*
struct AdvancedObservedObjectView: View { // child view
    @ObservedObject var object: StateObjectClass
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

struct AdvancedStateObjectView: View { // parent view
    @StateObject var object = StateObjectClass()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("number: \(object.number)")
                Button("increment number") {
                    object.number += 1
                    print("number: \(object.number)")
                }
                
                NavigationLink(destination: AdvancedObservedObjectView(object: object)) {
                    Text("To ObservedObjectView")
                }
            }
        }
    }
}
*/
