//
//  VoiceMemoApp.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/23.
//

import SwiftUI

@main
struct VoiceMemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
