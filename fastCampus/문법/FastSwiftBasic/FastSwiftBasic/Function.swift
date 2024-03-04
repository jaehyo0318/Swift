//
//  Function.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct Function: View {
    
    @State var inputNumber: Int = 4
    
    var body: some View {
        VStack{
            Text("Input number is \(inputNumber)")
            
            Button {
                inputNumber =  plusFive(inputNumber)
            } label: {
                Text("+5")
            }
        }
        
    }
    
    func plusFive(_ input: Int) -> Int {
        return input + 5
    }
}

struct Function_Previews: PreviewProvider {
    static var previews: some View {
        Function()
    }
}
