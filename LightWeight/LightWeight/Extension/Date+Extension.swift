//
//  Date+Extension.swift
//  LightWeight
//
//  Created by  서재효 on 4/16/24.
//

import Foundation

extension Date {
  static let calendarDayDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy dd"
    return formatter
  }()
  
  var formattedCalendarDayDate: String {
    return Date.calendarDayDateFormatter.string(from: self)
  }
}
