//
//  MyApp.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct MyApp: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        TabView {
            FirstList()
                .tabItem {
                    Label("first", systemImage: "folder")
                }
            
            Text("2")
                .tabItem {
                    Label("second", systemImage: "folder")
                }
            
            Text("3")
                .tabItem {
                    Label("third", systemImage: "folder")
                }
            
            Text("4")
                .tabItem {
                    Label("fourth", systemImage: "folder")
                }
            
        }
        .sheet(isPresented: $showModal, content: {
            TabView {
                OnboardingSample(onboardingTitle: "온보딩 1", backgroundColor: .gray)
                
                OnboardingSample(onboardingTitle: "온보딩 2", backgroundColor: .pink)
                
                ZStack {
                    Color.mint.ignoresSafeArea()
                    VStack {
                        Text("온보딩3")
                        Button {
                            
                        } label: {
                            Text("Start!")
                        }

                    }
                    
                }
            }
            .tabViewStyle(.page)
        })
        .onAppear {
            showModal = true
        }
    }
}

struct MyApp_Previews: PreviewProvider {
    static var previews: some View {
        MyApp()
    }
}
