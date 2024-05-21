//
//  OtherProfileViewModel.swift
//  LMessenger
//
//  Created by  서재효 on 5/1/24.
//

import Foundation

@MainActor
class OtherProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    
    private let container: DIContainer
    private let userId: String
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId) {
            userInfo = user
        }
    }
}
