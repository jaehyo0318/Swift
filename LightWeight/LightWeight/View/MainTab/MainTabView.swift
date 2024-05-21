//
//  MainTabView.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import SwiftUI


struct MainTabView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    @StateObject private var mainTabViewModel = MainTabViewModel()
    
    var body: some View {
        ZStack{
            TabView(selection: $mainTabViewModel.selectedTab
            ) {
                TimerView()
                    .tabItem {
                        Image(systemName: "timer")
                    } 
                    .tag(Tab.timer)
                
                HistoryView()
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    .tag(Tab.history)
                
                SettingView(authmodel: .init(container: .init(services: StubService())))
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
                    .tag(Tab.setting)
            }
            
        }
    }
}

#Preview {
    MainTabView()
}
