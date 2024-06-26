//
//  ChatImageItemView.swift
//  LMessenger
//
//  Created by  서재효 on 5/6/24.
//

import SwiftUI

struct ChatImageItemView: View {
    let urlString: String
    let direction: ChatItemDirection
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            
            URLImageView(urlString: urlString)
                .frame(width: 146, height: 146)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if direction == .left {
                Spacer()
            }
        }
        .padding(.horizontal, 35)
       
    }
}

#Preview {
    ChatImageItemView(urlString: "", direction: .right)
}
