//
//  Onboarding1.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct OnboardingSample: View {
    
    let onboardingTitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            Text(onboardingTitle)
        }
    }
}

struct OnboardingSample_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSample(onboardingTitle: "온보딩 ex", backgroundColor: .brown)
    }
}
