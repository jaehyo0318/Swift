//
//  Onboarding.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
            Text("What's New in Photos")
                .font(.system(size: 35))
                .bold()
                .padding(.vertical, 50)
            
            HStack {
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text("Shared Library")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the people Combine photos and videos with the people  Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            
            HStack {
                Image(systemName: "doc.on.doc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text("Copy & paste Edits")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the people Combine photos and videos with the people  Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "sparkles.square.filled.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text("Merge Duplicates")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the people Combine photos and videos with the people  Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Continue")
                    .padding()
                    .frame(width: 350)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            }
            .padding(.bottom, 100)

        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
