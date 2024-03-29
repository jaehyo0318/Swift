//
//  Condition.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/06.
//

import SwiftUI

struct Condition: View {
    
    var count = 4
    
    var hasLoggedIn = false
    
    var body: some View {
        if count > 4 {
            Text("숫자는 4보다 큽니다!")
        } else {
            Text("숫자는 4와 같거나 작습니다")
        }
        
        if hasLoggedIn {
            Text("로그아웃 하시겠습니까?")
        } else {
            Text("로그인 하시겠습니까?")
        }

//        guard hasLoggedIn else {
//            Text("로그인 하시겠습니까?")
//        }
//        Text("로그아웃 하시겠습니까?")
    }
}

struct Condition_Previews: PreviewProvider {
    static var previews: some View {
        Condition()
    }
}
