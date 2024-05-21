//
//  Services.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
}

class Services: ServiceType {
    var authService:  AuthenticationServiceType
    
    init() {
        self.authService = AuthenticationService()
    }
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    
}
