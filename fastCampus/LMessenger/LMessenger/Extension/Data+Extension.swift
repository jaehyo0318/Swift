//
//  Data+Extension.swift
//  LMessenger
//
//  Created by  서재효 on 5/4/24.
//

import Foundation

extension Date {
    
    var toChatTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a h:mm"
        return formatter.string(from: self)
    }
    
    var toChatDataKey: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd E"
        return formatter.string(from: self)
    }
}
