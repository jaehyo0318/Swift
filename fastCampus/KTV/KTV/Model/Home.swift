//
//  Home.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import Foundation

struct Home: Decodable{
    let videos: [Video]
    let rankings: [Ranking]
    let recents: [Recent]
    let recommends: [Recommend]
}

extension Home {
    struct Video: Decodable {
        let videoId: Int
        let isHot: Bool
        let title: String
        let subtitle: String
        let imageUrl: URL
        let channel: String
        let channelThumbnailImageUrl: URL
        let  channelDescription: String
    }
    
    struct Ranking: Decodable {
        let imageUrl: URL
        let videoId: Int
    }
    
    struct Recent: Decodable {
        let ImageUrl: URL
        let timeStamp: Double
        let title: String
        let channel: String
    }
    
    struct Recommend: Decodable {
        let imageUrl: URL
        let title: String
        let playTime: Double
        let channel: String
        let videoId: Int
    }
}
