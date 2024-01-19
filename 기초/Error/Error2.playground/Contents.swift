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

func test() {
    do {
        try parsing(data: ["name": ""])
    } catch DataParsingError.invalidType, DataParsingError.invalidFeilde {
        print("handle invalidType error")
    } catch {
        print("handle error")
        if let error = error as? DataParsingError {
            switch error {
            case .invalidType:
                print("invalidType")
            default:
                print("handleError")
            }
        }
    }
}

test()

func test2() throws {
    try parsing(data: ["name": ""])
}

try? test2()
