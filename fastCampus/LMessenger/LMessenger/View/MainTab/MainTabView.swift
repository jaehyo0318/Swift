//
//  MainTabView.swift
//  LMessenger
//
//  Created by  서재효 on 4/25/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var navigationRouter: NavigationRouter
    @State private var selecteedTab: MainTabType = .home
    
    var body: some View {
        TabView(selection: $selecteedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .home:
                        HomeView(viewModel: .init(container: container, navigationRouter: navigationRouter, userId: authViewModel.userId ?? ""))
                    case .chat:
                        ChatListView(viewModel: .init(container: container, userId: authViewModel.userId ?? ""))
                    case .phone:
                        Color.blackFix
                    }
                }
                .tabItem {
                    Label(tab.title, image: tab.imageName(selected: selecteedTab == tab))
                }
                .tag(tab)
            }
        }
        .tint(.bkText)
    }
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.bkText)
    }
}

struct MainTabView_PreViews: PreviewProvider {
    static let container = DIContainer(services: StubService())
    static let navigationRouter: NavigationRouter = .init()
    
    static var previews: some View {
        MainTabView()
            .environmentObject(Self.container)
            .environmentObject(AuthenticationViewModel(container: Self.container))
            .environmentObject(Self.navigationRouter)
    }
}
 
