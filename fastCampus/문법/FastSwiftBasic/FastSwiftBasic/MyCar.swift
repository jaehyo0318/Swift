//
//  MyCar.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/18.
//

import SwiftUI

protocol Driveable{
    func speedDown(with speed: Int) -> Int
}

struct MyCar: View {
    
    var myCar: KIA = KIA()
    var broCar: Hyundai = Hyundai()
    let cars: [Driveable] = [KIA(), Hyundai()]
    
    @State var speed: Int = 30
    
    var body: some View {
        VStack{
            Text("speed: \(speed)")
            
            Button {
//                speed = broCar.speedDown(with: speed)
                speed = (cars.first?.speedDown(with: speed))!
                
            } label: {
                Text("감속")
            }
        }
    }
}

struct KIA: Driveable {
    func speedDown(with speed: Int) -> Int {
        print("속도가 감속됩니다.")
        return speed - 3
    }
    
}

struct Hyundai: Driveable {
    func speedDown(with speed: Int) -> Int {
        print("속도가 빠르게 줄어듭니다.")
        
        return speed - 10
    }
    
    
}

struct MyCar_Previews: PreviewProvider {
    static var previews: some View {
        MyCar()
    }
}
