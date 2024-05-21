//
//  NavigationDestination.swift
//  LMessenger
//
//  Created by  서재효 on 5/1/24.
//

import Foundation

enum NavigationDestination: Hashable {
    case chat(chatRoomId: String, myUserId: String, otherUserId: String)
    case search(userId: String)
}
