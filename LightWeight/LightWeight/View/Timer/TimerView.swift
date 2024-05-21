//
//  TimerView.swift
//  LightWeight
//
//  Created by  서재효 on 4/8/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel = TimerViewModel()
    
    var body: some View {
        if timerViewModel.isSetTimeView {
            SetTimerView()
        }
    }
}

//MARK: 타이머 설정 뷰
private struct SetTimerView: View {
    
    fileprivate var body: some View {
        ZStack(alignment: .leading){
            Color.bgBlack
                .ignoresSafeArea()
            VStack() {
                HStack {
                    Text("타이머")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Spacer()
                
                HStack() {
                    VStack {
                        Text("운동시간")
                            .foregroundStyle(Color.white)
                    }
                    
                    VStack {
                        Text("쉬는시간")
                            .foregroundStyle(Color.white)
                    }
                    
                    VStack {
                        Text("반복횟수")
                            .foregroundStyle(Color.white)
                    }
                    
                    
                }
                
                Spacer()
            }
            
            
        }
    }
}


#Preview {
    TimerView()
}
