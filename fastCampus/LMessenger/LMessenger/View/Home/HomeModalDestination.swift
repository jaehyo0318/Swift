//
//  HomeModalDestination.swift
//  LMessenger
//
//  Created by  서재효 on 4/28/24.
//

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    case setting
    
    var id: Int {
        hashValue
    }
}
