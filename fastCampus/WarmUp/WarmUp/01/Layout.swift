//
//  Layout.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack {
            Image(systemName: "icloud")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            
            Text("Text Element 1")
                .font(.headline)
                .padding()
            
            Text("Text Element 2")
                .font(.subheadline)
                .padding()
            
            Text("Text Element 3")
                .font(.system(size: 20))
                .padding()
            
            HStack {
                MyButton(buttonTitle: "Button 1",
                         buttonColor: .blue)
                MyButton(buttonTitle: "Button 2",
                         buttonColor: .mint)
            }
            
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("Complex Button")
                }
                .foregroundColor(.white)
                .padding()
                .background(.orange)
                .cornerRadius(10)
            }

            
            
        }
    }
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Layout()
    }
}
