//
//  Nil.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/18.
//

import SwiftUI

struct Nil: View {
    
    var name: String = "jaehyo"
    var petName: String?
    
    var bami: String = "Bami"
    var petName2: String = "coco"
    
    var body: some View {
        VStack{
//            Text("이름은 \(name) 펫 네임은 \(petName)입니다.")
            Text("이름은 \(bami) 펫 네임은 \(petName2)입니다.")
        }
        .onAppear{
            print("이름은 \(name) 펫 네임은 \(petName)입니다.")
            print("이름은 \(bami) 펫 네임은 \(petName2)입니다.")
        }
        
    }
}



struct Nil_Previews: PreviewProvider {
    static var previews: some View {
        Nil()
    }
}
