//
//  Memo.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/27.
//

import Foundation

struct Memo: Hashable {
    var title: String
    var content: String
    var date: Date
    var id = UUID()
    
    var convertedDate: String {
        String("\(date.formattedDay) - \(date.formattedTime)")
    }
}
