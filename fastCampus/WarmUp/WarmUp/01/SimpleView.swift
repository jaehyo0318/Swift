//
//  SimpleView.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack {
            Image(systemName: "moon.stars")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("헤드라인 텍스트")
                .font(.headline)
                .bold()
                .padding()
            
            Text("서브헤드라인 텍스트")
                .font(.subheadline)
                .padding()
            
            Text("바디 텍스트")
                .font(.body)
                .padding()
            
            Button {
                
            } label: {
                Text("Click me")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .bold()
            }

        }
    }
}

struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}
