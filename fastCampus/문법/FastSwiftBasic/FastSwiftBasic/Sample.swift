//
//  Sample.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/18.
//

import SwiftUI

struct Sample: View {
    
    let data = [
        Destination(direction: .north, food: "파스타맛집", image: Image(systemName: "carrot")),
        Destination(direction: .east, food: nil, image: Image(systemName: "sunrise")),
        Destination(direction: .west, food: nil, image: Image(systemName: "mountain.2")),
        Destination(direction: .south, food: "국밥맛집", image: Image(systemName: "baseball.fill"))
    ]
    
    @State var selectedDestination: Destination?
    
    var body: some View {
        VStack {
            selectedDestination?.image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            if let destination = selectedDestination {
                Text(destination.direction.rawValue)
                if let food = destination.food {
                    Text(food)
                }
            }
            
            
            Button {
                selectedDestination = data.randomElement()
            } label: {
                Text("돌려요")
            }

        }
    }
}

struct Destination {
    let direction: Direction3
    let food: String?
    let image: Image
}

enum Direction3: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
