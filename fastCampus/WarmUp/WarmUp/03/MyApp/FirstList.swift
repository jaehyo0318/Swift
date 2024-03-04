//
//  FirstList.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct FirstList: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("첫 번째 페이지 입니다.")
                } label: {
                    Text("첫 번째 하위 페이지")
                }
                
                NavigationLink {
                    Text("두 번째 페이지 입니다.")
                } label: {
                    Text("두 번째 하위 페이지")
                }
                
                NavigationLink {
                    Text("세 번째 페이지 입니다.")
                } label: {
                    Text("세 번째 하위 페이지")
                }
                
                NavigationLink {
                    Text("네 번째 페이지 입니다.")
                } label: {
                    Text("네 번째 하위 페이지")
                }
            }
                
        }
    }
}

struct FirstList_Previews: PreviewProvider {
    static var previews: some View {
        FirstList()
    }
}
