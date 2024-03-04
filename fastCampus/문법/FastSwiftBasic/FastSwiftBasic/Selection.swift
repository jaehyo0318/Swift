//
//  Selection.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/17.
//

import SwiftUI

struct Selection: View {
    
    @State var myDirection: Direction2 = .myway
    
    var body: some View {
        
        VStack{
            switch myDirection {
            case .north:
                Text("북쪽은 추워요")
            case .west:
                Text("서쪽은 석양이 예뻐요")
            case .east:
                Text("동쪽으로 해 보러 갈래요?")
            case .south:
                Text("남쪽으로 쉬러가요")
            default:
                Text("Error")
            }
            
            Button {
                
                switch myDirection {
                case .north, .west:
                    myDirection = .east
                case .east:
                    myDirection = .south
                default:
                    myDirection = .north
                }
                
            } label: {
                Text("돌리기")
            }
        }
    }
    
    
}

enum Direction2: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
    case myway
}

struct Selection_Previews: PreviewProvider {
    static var previews: some View {
        Selection()
    }
}
