//
//  SettingView.swift
//  LightWeight
//
//  Created by  서재효 on 4/8/24.
//

import SwiftUI

struct SettingView: View {
    @StateObject var authmodel: AuthenticationViewModel
    
    var body: some View {
        ZStack{
            Color.bgBlack
                .ignoresSafeArea()
            VStack {
                Text("setting")
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Button {
                    authmodel.send(action: .logout)
                } label: {
                    Text("로그아웃")
                }.buttonStyle(LoginButtonStyle(textColor: .blue))
            }
            

        }
        
    }
    
}

#Preview {
    SettingView(authmodel: .init(container: .init(services: StubService())))
        
}
