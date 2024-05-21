//
//  UserObject.swift
//  LMessenger
//
//  Created by  서재효 on 4/28/24.
//

import Foundation

struct UserObject: Codable {
    var id: String
    var name: String
    var phoneNumber: String?
    var profileURL: String?
    var description: String?
}

extension UserObject {
    func toModel() -> User {
        .init(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            profileURL: profileURL,
            description: description
        )
    }
}
