//
//  LightWeightApp.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct LightWeightApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var container: DIContainer = .init(services: Services())
    
    init() {
        KakaoSDK.initSDK(appKey: "e963b58c6e416579eddf9cc5272de0d9")
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView(authViewModel: .init(container: container))
                .environmentObject(container)
                .onOpenURL{ url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
