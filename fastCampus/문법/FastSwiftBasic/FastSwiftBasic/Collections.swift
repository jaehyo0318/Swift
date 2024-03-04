//
//  Collections.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct Collections: View {
    
    var foods: [String] = ["egg", "banana", "bean"]
    var jazz: Set<String> = ["bibidudu", "ladap", "dididudu"]
    var hiphop: Set<String> = ["ladap", "rap", "wow"]
    var koEngDict = ["사과": "Apple", "바나나": "Banana"]
    
    var body: some View {
        VStack {
            Text(foods[0])
            Button {
                var intersection = jazz.intersection(hiphop)
//                intersection.description
            } label: {
                Text("hit!")
            }
            Text(jazz.intersection(hiphop).description)
            Text(koEngDict["사과"]!)
            
        }
    }
}

struct Collections_Previews: PreviewProvider {
    static var previews: some View {
        Collections()
    }
}
