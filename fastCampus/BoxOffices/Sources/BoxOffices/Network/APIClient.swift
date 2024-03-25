//
//  APIClient.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

class APIClient {
    private let basURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response: Decodable> (
        path: String, // /boxoffice/searchDailyBoxOfficeList.json
        httpMethod: HTTPMethod,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Response {
        // URL Request
        let urlRequest = try URLRequest(
            urlString: "\(basURL)/\(path)",
            httpMethod: httpMethod,
            key: key,
            quertyItems: queryItems
        )
        
        // URLSession data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
       
       // HTTP URL Response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse) {
            throw error
        }
        
        // Decoding
        let output = try JSONDecoder().decode(Response.self, from: data)
        
        return output
    }
}
