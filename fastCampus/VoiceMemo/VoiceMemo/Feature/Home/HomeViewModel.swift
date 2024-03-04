//
//  HomeViewModel.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/27.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var todoCount: Int
    @Published var memoCount: Int
    @Published var voiceRecorderCount: Int
    
    init(
        selectedTab: Tab = .voiceRecorder,
        todoCount: Int = 0,
        memoCount: Int = 0,
        voiceRecorderCount: Int = 0
    ) {
        self.selectedTab = selectedTab
        self.todoCount = todoCount
        self.memoCount = memoCount
        self.voiceRecorderCount = voiceRecorderCount
    }
}

extension HomeViewModel {
    // 3가지는 -> TodoCount-VoiceRecorderCount 갯수 변경
    func setTodoCount(_ count: Int) {
        todoCount = count
    }
    
    func setMemoCount(_ count: Int) {
        memoCount = count
    }
    
    func setVoiceRecorderCount(_ count: Int) {
        voiceRecorderCount = count
    }
    
    // Tab 변경 메서드
    func changeSelectedTab(_ tab: Tab) {
        selectedTab = tab
    }
}
