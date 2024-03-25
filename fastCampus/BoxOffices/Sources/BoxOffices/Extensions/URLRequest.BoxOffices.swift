//
//  URLRequest.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

extension URLRequest {
    init(
        urlString: String,
        httpMethod: HTTPMethod,
        key: String,
        quertyItems: [URLQueryItem]?
    ) throws {
        //URL Components
        guard var components = URLComponents(string: urlString) else {
            throw APIError.urlIsError // error
        }
        
        //Query Items
        components.queryItems = [URLQueryItem(name: "key", value: key)]
        if let quertyItems {
            components.queryItems?.append(contentsOf: quertyItems)
        }
        
        //URL Request
        guard let url = components.url else {
            throw APIError.urlIsError
        }
        
        self.init(url: url)
        
        //HTTP Method
        self.httpMethod = httpMethod.capitalizedValue
    }
}
