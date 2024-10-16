//
//  LMessengerApp.swift
//  LMessenger
//
//  Created by  서재효 on 4/25/24.
//

import SwiftUI

@main
struct LMessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var container: DIContainer = .init(services: Services())
    @AppStorage(AppStorageType.Appearance) var appearanceValue: Int = UserDefaults.standard.integer(forKey: AppStorageType.Appearance)
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init(container: container), 
                              navigationRouter: .init(),
                              searchDataController: .init(), appearanceController:.init(appearanceValue))
                .environmentObject(container)
        }
    }
}
