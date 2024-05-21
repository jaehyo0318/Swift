//
//  DIContainer.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}

