import UIKit

enum DataParsingError: Error {
    case invalidType
    case invalidFeilde
    case missingRequiredFeild(String)
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredFeild("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
}

try? parsing(data: [:])
