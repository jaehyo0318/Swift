//
//  MyButton.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct MyButton: View {
    var buttonTitle: String
    var buttonColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonTitle)
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
        }
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(buttonTitle: "Button 99", buttonColor: .brown)
    }
}
