//
//  Option.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/18.
//

import SwiftUI

struct Option: View {
    
    var jaehyo: People? //= People(name: "jaehyo", mbti: MBTI(name: "ENTJ"))
    var bami = People(name: "bami", petName: "coco")
    var karina = People(name: "karina", petName: "cookie")
    
    var body: some View {
        VStack {
            
            if let jaehyo = jaehyo {
                if let mbti = jaehyo.mbti {
                    if let name = mbti.name{
                        
                    }
                }
            }
            
            if let jaehyoMbtiName = jaehyo?.mbti?.name {
                Text(jaehyoMbtiName)
            } else {
                Text("no MBTI name")
            }
            
//            if let petName = jaehyo.petName {
//                Text("이름은 \(jaehyo.name) 애완동물 이름은 \(petName)")
//            } else {
//                Text("이름은 \(jaehyo.name) 애완동물은 없어요")
//            }
            
            if let petName = bami.petName {
                Text("이름은 \(bami.name) 애완동물 이름은 \(petName)")
            } else {
                Text("이름은 \(bami.name) 애완동물은 없어요")
            }
            
            if let petName = karina.petName {
                Text("이름은 \(karina.name) 애완동물 이름은 \(petName)")
            } else {
                Text("이름은 \(karina.name) 애완동물은 없어요")
            }
            
            
            
            
        }
    }
}

struct People {
    let name: String
    var petName: String?
    var mbti: MBTI?
}

struct MBTI {
    let name: String?
}

struct Option_Previews: PreviewProvider {
    static var previews: some View {
        Option()
    }
}
