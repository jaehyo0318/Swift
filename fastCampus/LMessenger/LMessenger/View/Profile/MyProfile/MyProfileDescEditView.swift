//
//  MyProfileDescEditView.swift
//  LMessenger
//
//  Created by  서재효 on 4/29/24.
//

import SwiftUI

struct MyProfileDescEditView: View {
    @Environment(\.dismiss) var dismiss
    @State var description: String
    
    var onCompletion: (String) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("상태메세지를 입력해주세요", text: $description)
                    .multilineTextAlignment(.center)
            }
            .toolbar {
                Button("완료") {
                    dismiss()
                    onCompletion(description)
                }
                .disabled(description.isEmpty)
            }
        }
    }
}

#Preview {
    MyProfileDescEditView(description: "") { _ in
        
    }
}
