//
//  VariableType.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct VariableType: View {
    
    var name: String = "Karina"
    var age: Int = 25
    var height: Float = 167.1
    var weight: Double = 45.1
    var havePet: Bool = false
    
    var body: some View {
        VStack{
            Text("\(name)")
            Text("\(age)")
            Text("\(height)")
            Text("\(weight)")
            Text("\(havePet.description)")
        }
    }
}

struct VariableType_Previews: PreviewProvider {
    static var previews: some View {
        VariableType()
    }
}
