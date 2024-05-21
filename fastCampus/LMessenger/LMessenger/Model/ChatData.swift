//
//  ChatData.swift
//  LMessenger
//
//  Created by  서재효 on 5/4/24.
//

import Foundation

struct ChatData: Hashable, Identifiable {
    var dateStr: String
    var chats: [Chat]
    var id: String { dateStr }
}
