//
//  ContentView.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
            Image(systemName: "globe")
                .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .foregroundColor(.accentColor)
            Text("Hello, world")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(Color.orange)
                .padding(.horizontal, 1.0)
                
                
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
