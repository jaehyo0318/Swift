//
//  UploadSourceType.swift
//  LMessenger
//
//  Created by  서재효 on 4/30/24.
//

import Foundation

enum UploadSourceType {
    case chat(chatRoomId: String)
    case profile(userId: String)
    
    var path: String {
        switch self {
        case .chat(let chatRoomId):
            "\(DBKey.Chats)/\(chatRoomId)"
        case .profile(let userId):
            "\(DBKey.Users)/\(userId)"
        }
    }
}
