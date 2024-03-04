//
//  SettingClone.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/19.
//

import SwiftUI

struct SettingInfo: Hashable {
    let title: String
    let systemName: String
    let backgroundColor: Color
    var forgroundColor: Color = .white
}


struct SettingClone: View {
    
    var data: [[SettingInfo]] = [[SettingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple)],
                                 
                                 [SettingInfo(title: "일반", systemName: "gear", backgroundColor: .gray),
                                  SettingInfo(title: "손쉬운 사용", systemName: "person.crop.circle", backgroundColor: .blue),
                                  SettingInfo(title: "개인정보 보호 및 보안", systemName: "hourglass", backgroundColor: .blue)],
                                 
                                 [ SettingInfo(title: "암호", systemName: "key.fill", backgroundColor: .gray)],
                                 
                                 [ SettingInfo(title: "Safari", systemName: "safari", backgroundColor: .white,
                                     forgroundColor: .blue),
                                   
                                   SettingInfo(title: "News", systemName: "newspaper.fill", backgroundColor: .white,
                                       forgroundColor: .red),
                                   
                                   SettingInfo(title: "번역", systemName: "character.book.closed.fill", backgroundColor: .white,
                                       forgroundColor: .black),
                                   
                                   SettingInfo(title: "지도", systemName: "map.fill", backgroundColor: .white,
                                       forgroundColor: .mint),
                                   SettingInfo(title: "단축어", systemName: "square.and.arrow.down.on.square.fill", backgroundColor: .white,
                                               forgroundColor: .indigo)]
    ]
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(data, id: \.self) { section in
                    Section {
                        ForEach(section, id:\.self) { item in
                            Label {
                                Text(item.title)
                            } icon: {
                                Image(systemName: item.systemName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .padding(.all, 4)
                                    .background(item.backgroundColor)
                                    .foregroundColor(item.forgroundColor)
                                    .cornerRadius(6)
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}

struct SettingClone_Previews: PreviewProvider {
    static var previews: some View {
        SettingClone()
    }
}
