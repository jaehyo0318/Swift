//
//  MainTabViewModel.swift
//  LightWeight
//
//  Created by  서재효 on 4/8/24.
//

import Foundation

class MainTabViewModel: ObservableObject {
    @Published var selectedTab: Tab
    
    init(selectedTab: Tab = .timer) {
        self.selectedTab = selectedTab
    }
}
