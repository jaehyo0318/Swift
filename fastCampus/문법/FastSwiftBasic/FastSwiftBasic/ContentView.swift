//
//  ContentView.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct ContentView: View {
    
    var name: String = "Karina"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(name)님 안녕하세요!")
            Text("\(name)님의 포인트는 343점 입니다")
            Text("\(name)님 안녕히가세요.")
            Text(name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
