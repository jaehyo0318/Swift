//
//  Loop.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct Loop: View {
    
    let names: [String] = ["karina", "Winter", "Gigel", "Ningning"]
    
    var body: some View {
        
        VStack {
            ForEach(names, id: \.self) { item in
                Text(item)
            }
        }
        
    }
}

struct Loop_Previews: PreviewProvider {
    static var previews: some View {
        Loop()
    }
}
