//
//  DBError.swift
//  LMessenger
//
//  Created by  서재효 on 4/28/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
    case invalidatedType
}
