//
//  File.swift
//  
//
//  Created by  서재효 on 3/23/24.
//

import Foundation

extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}
