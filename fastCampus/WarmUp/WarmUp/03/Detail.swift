//
//  Detail.swift
//  WarmUp
//
//  Created by  서재효 on 2024/02/20.
//

import SwiftUI

struct Detail: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("모달 페이지 입니다")
        Button {
            isPresented = false
        } label: {
            Text("닫기")
        }

    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(isPresented: .constant(true))
    }
}
