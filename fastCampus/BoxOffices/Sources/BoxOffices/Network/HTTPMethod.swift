//
//  HTTPMethod.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

enum HTTPMethod: String {
    case get // , post, delete, put,  "GET"
    
    var capitalizedValue: String {
        self.rawValue.capitalized // .get -> "GET"
    }
}
