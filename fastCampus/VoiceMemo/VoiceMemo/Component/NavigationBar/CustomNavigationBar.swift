//
//  CustomNavigationBar.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/26.
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDiplayLeftBtn: Bool
    let isDiplayRightBtn: Bool
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    let rightBtnType: NavigationBtnType
    
    init(
        isDiplayLeftBtn: Bool = true,
        isDiplayRightBtn: Bool = true,
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {},
        rightBtnType: NavigationBtnType = .edit
    ) {
            
        self.isDiplayLeftBtn = isDiplayLeftBtn
        self.isDiplayRightBtn = isDiplayRightBtn
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
        self.rightBtnType = rightBtnType
       
    }
    
    var body: some View {
        HStack{
            if isDiplayLeftBtn {
                Button (
                    action: leftBtnAction,
                    label: { Image("leftArrow") }
                )

            }
            
            Spacer()
            
            if isDiplayRightBtn {
                Button(
                    action: rightBtnAction,
                    label: {
                        if rightBtnType == .close {
                            Image("close")
                        } else {
                            Text(rightBtnType.rawValue)
                                .foregroundColor(.customBlack)
                        }
                    }
                )
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 20)
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
