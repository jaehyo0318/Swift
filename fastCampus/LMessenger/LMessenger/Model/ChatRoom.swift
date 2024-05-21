//
//  ChatRoom.swift
//  LMessenger
//
//  Created by  서재효 on 5/1/24.
//

import Foundation

struct ChatRoom: Hashable {
    var chatRoomId: String
    var lastMessage: String?
    var otherUserName: String
    var otherUserId: String
}

extension ChatRoom {
    func toObject() -> ChatRoomObject {
        .init(chatRoomId: chatRoomId,
              lastMessage: lastMessage,
              otherUserName: otherUserName,
              otherUserId: otherUserId)
    }
}

extension ChatRoom {
    static var stub1: ChatRoom {
        .init(chatRoomId: "stub.chatRoomId", otherUserName: "테스트", otherUserId: "stub.otherUserId")
    }
    
    static var stub2: ChatRoom {
        .init(chatRoomId: "stub.chatRoomId2", lastMessage: "stub.lastMessage2", otherUserName: "테스트2", otherUserId: "stub.otherUserId2")
    }
}
