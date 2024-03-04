//
//  MyTab.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct MyTab: View {
    var body: some View {
        
        TabView {
            TabDetail()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            TabDetail2()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            TabDetail3()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        
    }
}

struct MyTab_Previews: PreviewProvider {
    static var previews: some View {
        MyTab()
    }
}
