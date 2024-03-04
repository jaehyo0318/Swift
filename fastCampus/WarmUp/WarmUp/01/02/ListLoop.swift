//
//  ListLoop.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//


struct Fruit: Hashable {
    let name: String
    let matchFruitName: String
    let price: Int
}

import SwiftUI

struct ListLoop: View {
    
    @State var favoriteFruits = [
        Fruit(name: "Apple",
              matchFruitName: "Banana",
              price: 1000),
        Fruit(name: "Banana",
              matchFruitName: "Apple",
              price: 1000),
        Fruit(name: "Cherry",
              matchFruitName: "Elder berry",
              price: 1000),
        Fruit(name: "Durian",
              matchFruitName: "Cherry",
              price: 1000),
        Fruit(name: "Elder berry",
              matchFruitName: "Apple",
              price: 1000),
        Fruit(name: "Apple",
              matchFruitName: "Banana",
              price: 1000),
        
    ]
    
    @State var fruitName: String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack {
                
                HStack {
                    TextField("insert fruit name", text: $fruitName)
                    
                    Button {
                        favoriteFruits.append(Fruit(name: fruitName, matchFruitName: "Apple", price: 1700))
                    } label: {
                        Text("insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                }
                .padding()
                
                List {
                    ForEach(favoriteFruits, id: \.self) { fruit in
                        VStack(alignment: .leading){
                            Text("name: \(fruit.name)")
                            Text("matchFruitName: \(fruit.matchFruitName)")
                            Text("price: \(fruit.price)")
                        }
                        
                    } .onDelete { indexSet in
                        favoriteFruits.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("Fruit List")
            }
            
            
        }
        
    }
}

struct ListLoop_Previews: PreviewProvider {
    static var previews: some View {
        ListLoop()
    }
}
