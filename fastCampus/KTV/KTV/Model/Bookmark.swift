//
//  Bookmark.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import Foundation

struct Bookmark: Decodable {
    let channels: [Item]
}

extension Bookmark {
    
    struct Item: Decodable {
        let channel: String
        let channelId: Int
        let thumbnail: URL
    }
}
