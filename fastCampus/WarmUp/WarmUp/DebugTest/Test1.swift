//
//  Test1.swift
//  WarmUp
//
//  Created by  서재효 on 3/21/24.
//

import SwiftUI

struct Test1: View {
    @State var data = [0, 1, 2, 3]
    @State var color: Color = .green
    var body: some View {
        ZStack {
            Button{
                color = .red
            } label: {
                Text("Button")
                    .padding(40)
                    
            }
            
            Text("Test")
                .padding()
                .background(color)
        }
    }
}

#Preview {
    Test1()
}
