//
//  VideoListItem.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import Foundation

struct VideoListItem: Decodable {
    let imageUrl: URL
    let title: String
    let playtime: Double
    let channel: String
    let videoId: Int
}
