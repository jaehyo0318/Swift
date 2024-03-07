//
//  DataLoader.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import Foundation

struct DataLoader {
    private static let session: URLSession = .shared
    
    static func load<T: Decodable>(url: String, for type: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw URLError(.unsupportedURL)
        }
        
        let data = try await Self.session.data(for: .init(url: url)).0
        let jsomDecoder = JSONDecoder()
        
        return try jsomDecoder.decode(T.self, from: data)
    }
}
