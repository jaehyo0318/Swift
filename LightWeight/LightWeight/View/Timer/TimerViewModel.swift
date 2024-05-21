//
//  TimerViewModel.swift
//  LightWeight
//
//  Created by  서재효 on 4/8/24.
//

import Foundation


class TimerViewModel: ObservableObject {
    @Published var isSetTimeView: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timeRemaining: Int
    @Published var isPuased: Bool
    
    init(
        isSetTimeView: Bool = true,
        time: Time = .init(minutes: 0, seconds: 0),
        timer: Timer? = nil,
        timeRemaining: Int = 0,
        isPuased: Bool = false
    ) {
        self.isSetTimeView = isSetTimeView
        self.time = time
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.isPuased = isPuased
    }
}
