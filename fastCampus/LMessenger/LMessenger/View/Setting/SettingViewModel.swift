//
//  SettingViewModel.swift
//  LMessenger
//
//  Created by  서재효 on 5/13/24.
//

import Foundation

class SettingViewModel: ObservableObject {
    
    @Published var sectionItems: [SectionItem] = []
    
    init() {
        self.sectionItems = [
            .init(label: "모드설정", settings: AppearanceType.allCases.map { .init(item: $0)})
        ]
    }
}
