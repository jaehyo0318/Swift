//
//  Time.swift
//  LightWeight
//
//  Created by  서재효 on 4/8/24.
//

import Foundation

struct Time {
    var minutes: Int
    var seconds: Int
    
    var convertedSeconds: Int {
        return (minutes * 60) + seconds
    }
    
    static func fromSeconds(_ seconds: Int) -> Time {
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = (seconds % 3600) % 60
        return Time(minutes: minutes, seconds: remainingSeconds)
    }
    
}
