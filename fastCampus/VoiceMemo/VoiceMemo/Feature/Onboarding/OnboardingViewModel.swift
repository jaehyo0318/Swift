//
//  OnboardingViewModel.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/26.
//

import Foundation

class OnboardingViewModel: ObservableObject{
    @Published var onBoardingContents: [OnboardingContent]
    
    init(
        onBoardingContents: [OnboardingContent] = [
            .init(imageFileName: "onboarding1", title: "오늘의 할일", subTitle: "To do list로 언제 어디서든 해야할일을 한눈에"),
            
            .init(imageFileName: "onboarding2", title: "똑똑한 나만의 기록장", subTitle: "메모장으로 생각나는 기록은 언제든지"),
            
            .init(imageFileName: "onboarding3", title: "하나라도 놓치고 싶지않은 기록까지", subTitle: "음성메모 기능으로 놓치고 싶지않은 기록까지"),
            
            .init(imageFileName: "onboarding4", title: "정확한 시간의 경과", subTitle: "타이머 기능으로 원하는 시간을 확인")


    ]) {
        self.onBoardingContents = onBoardingContents
    }
}


