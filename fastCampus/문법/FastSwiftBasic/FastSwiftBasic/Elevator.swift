//
//  Elevator.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/07.
//

import SwiftUI

struct Elevator: View {
    
   @State var myElevator = ElevatorStruct()
    
    var body: some View {
        VStack {
            Text("층수: \(myElevator.floor)")
            
            HStack {
                Button {
                    myElevator.goDown()
                } label: {
                    Text("아래로")
                }
                
                Button {
                    myElevator.goUp()
                } label: {
                    Text("위로")
                }

            }
        }
    }
}

struct ElevatorStruct {
    var floor: Int = 1
    
    mutating func goDown() {
        floor = floor - 1
    }
    
    mutating func goUp(){
        floor = floor + 1
    }
}

struct Elevator_Previews: PreviewProvider {
    static var previews: some View {
        Elevator()
    }
}
