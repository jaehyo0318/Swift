//
//  Response.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList: [Movie]
    }
}
