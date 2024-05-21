//
//  LoginIntroView.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import SwiftUI

struct LoginIntroView: View {
    @State private var isPresntedLoginView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("환영합니다.")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(Color.white)
                
                Text("Light Weight 로 체계적인 운동을 시작해보세요!")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button {
                    isPresntedLoginView.toggle()
                } label: {
                    Text("로그인")
                }.buttonStyle(LoginButtonStyle(textColor: .blue))
                
                Spacer()
                    .frame(height: 20)
            }
            .navigationDestination(isPresented: $isPresntedLoginView) {
                LoginView()
            }
            .background(Color.bgBlack)
        }
    }
}

#Preview {
    LoginIntroView()
}
