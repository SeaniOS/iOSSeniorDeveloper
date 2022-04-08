//
//  ObservedObjectView.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 08/04/2022.
//

import SwiftUI

// A property wrapper type that subscribes to an observable object
// and invalidates a view whenever the observable object changes
/*
@StateObject: Là 1 phần và được quản lý bởi View. Nó được thực thi trước khi body của View được khởi tạo, nó là dạng “source of truth” của View.
@ObservedObject: Không phải là 1 phần của View, vì thế tất nhiên là không được quản lý bởi View. Không có gì đảm bảo được rằng trong body, data của @ObservedObject đã được sẵn sàng. Có thể gây ra crash App nếu data chưa tồn tại

@State được khởi tạo từ View cha, @Binding khai báo ở View con. Data được pass từ @State -> @Binding.
@StateObject được tạo từ View cha, @ObservedObject được khai báo ở View con. Data được pass từ @StateObject -> @ObservedObject.
 */
struct ObservedObjectView: View {
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

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}
