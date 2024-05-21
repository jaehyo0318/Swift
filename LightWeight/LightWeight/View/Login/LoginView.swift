//
//  LoginView.swift
//  LightWeight
//
//  Created by  서재효 on 4/2/24.
//

import SwiftUI

struct LoginView: View {
    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Group{
                Text("로그인")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.white)
                    .padding(.top, 80)
                
                Text("아래 제공되는 서비스로 로그인을 해주세요")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button {
                authViewModel.send(action: .googleLogin)
            } label: {
                Text("Google로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .blue))
            
            Button {
                // TODO: apple
            } label: {
                Text("Apple로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .blue))
            
            Button {
                authViewModel.send(action: .kakoLogin)
            } label : {
                Text("Kakao로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .blue))
            
            Spacer()
                .frame(height: 20)
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.backward.fill")
                }
            }
        }
        .overlay {
            if authViewModel.isLoading {
                ProgressView()
            }
        }
        .background(Color.bgBlack)
    }
}

#Preview {
    LoginView()
}
