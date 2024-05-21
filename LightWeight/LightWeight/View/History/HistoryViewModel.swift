//
//  HistoryViewModel.swift
//  LightWeight
//
//  Created by  서재효 on 4/16/24.
//

import Foundation

class HistoryViewModel: ObservableObject {
    @Published var month: Date = Date()
    @Published var clickedCurrentMonthDates: Date?
    @Published var workedDate: Date?
    
    init(
        month: Date = Date(),
        clickedCurrentMonthDates: Date? = nil,
        workedDate: Date? = nil
    ) {
        self.month = month
        self.clickedCurrentMonthDates = clickedCurrentMonthDates
        self.workedDate = workedDate
    }
}
