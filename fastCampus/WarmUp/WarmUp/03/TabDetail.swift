//
//  TabDetail.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct TabDetail: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("This is detail")
        }
        
    }
}

struct TabDetail2: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("This is detail2")
                Button {
                    
                } label: {
                    Text("Continue")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            
        }
        
    }
}

struct TabDetail3: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("This is detail3")
        }
        
    }
}

struct TabDetail_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail()
    }
}
