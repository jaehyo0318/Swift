//
//  Model.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct Modal: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            Text("메인 페이지 입니다")
            
            Button {
                showModal = true
            } label: {
                Text("Modal 전환")
            }
        }
        .sheet(isPresented: $showModal) {
            Detail(isPresented: $showModal)
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
    }
}
