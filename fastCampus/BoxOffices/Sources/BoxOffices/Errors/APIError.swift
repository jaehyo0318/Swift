//
//  APIError.swift
//
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

public enum APIError: Error {
    case urlIsError
    case reponseIsNotExpected
    case requestIsInvalid(_ statusCode: Int)
    case serverIsNotResponse(_ statusCode: Int)
    case reponseIsUnsuccesful(_ statusCode: Int)
}

extension APIError {
    init?(httpResponse: HTTPURLResponse?) {
        guard let httpResponse  else {
            self =  APIError.reponseIsNotExpected // error
            return
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return nil
        case 400..<500:
            self =  APIError.requestIsInvalid(httpResponse.statusCode)
        case 500..<600:
            self =  APIError.serverIsNotResponse(httpResponse.statusCode)
        default:
            self =  APIError.reponseIsUnsuccesful(httpResponse.statusCode)
        }
    }
}
