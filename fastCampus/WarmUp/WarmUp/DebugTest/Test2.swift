//
//  Test2.swift
//  WarmUp
//
//  Created by  서재효 on 3/21/24.
//

import SwiftUI

struct Test2: View {
    @State var data = [0, 1, 2, 3]
    @State var selectedNumber = 0
    
    var body: some View {
        List {
            ForEach(data, id: \.self) { item in
                Button {
                    selectedNumber = item
                    data.remove(at: item)
//                    data.remove(at: data.firstIndex(of: item)!)
                } label: {
                    
                    Text("\(item)")
                
                }
            }
        }
    }
    
    
}

#Preview {
    Test2()
}
