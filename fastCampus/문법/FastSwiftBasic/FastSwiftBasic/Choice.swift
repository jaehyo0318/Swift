//
//  Choice.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/17.
//

import SwiftUI

struct Choice: View {
    
    var direction: Direction = .south
    var member: Member = .coco
    var menu: Menu = .steak("레어")
    
    
    var body: some View {
        Text("방향은 \(direction.rawValue)쪽 입니다.")
    }
    
}

enum Direction: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

enum Member: String {
    case jaehyo, tim, coco, karina
}

enum Menu {
    case pasta
    case pizza
    case steak(String)
}

struct Choice_Previews: PreviewProvider {
    static var previews: some View {
        Choice()
    }
}
