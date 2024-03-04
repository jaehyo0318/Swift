//
//  Diff.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/15.
//

import SwiftUI

struct Diff: View {
    
    let myCar = Car(name: "리어카", owner: "재효")
    
    @ObservedObject var myKar = Kar(name: "리어카2", owner: "재효2")
    
    @State var name: String = ""
    
    var body: some View {
        VStack{
            Text("\(myKar.name)의 주인은 \(myKar.owner)입니다")
            
        TextField("Placeholder", text: $name)
            
            Button {
                let broCar = myKar
                broCar.name = "동생차"
                broCar.owner = "동생"
                
                myKar.sayHi()
                
            } label: {
                Text("출발")
            }
        }
    }
}

struct Car {
    let name: String
    let owner: String
    
    func sayHi () {
        print("hi, \(owner)")
    }
}

class Kar: ObservableObject {
    @Published var name: String
    var owner: String

    
    func sayHi () {
        print("hi, \(owner)")
    }
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
}

struct Diff_Previews: PreviewProvider {
    static var previews: some View {
        Diff()
    }
}
