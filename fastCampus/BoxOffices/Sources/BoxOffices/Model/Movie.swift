//
//  Movie.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

public struct Movie: Decodable {
    public let rank: String
    public let code: String
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
}
