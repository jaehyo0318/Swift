//
//  HalfReview.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct HalfReview: View {
 
    var names: [String] = ["Karina", "Winter", "Gigel", "Ningning"]
    
    var body: some View {
        List {
            ForEach(names, id: \.self) {name in
                let welcome = sayHi(to: name)
                if name == "Karina" {
                    Text("How are you \(name)")
                } else {
                    Text(welcome)
                }
                
            }
        }
    }
    
    func sayHi(to name: String) -> String {
        return "\(name) Hi"
    }
}

struct HalfReview_Previews: PreviewProvider {
    static var previews: some View {
        HalfReview()
    }
}
