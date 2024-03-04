//
//  MyGeneric.swift
//  FastSwiftBasic
//
//  Created by  서재효 on 2024/02/18.
//

import SwiftUI

struct MyGeneric: View {
    
    @State var input = ""
    @State var myStack = MyStack<Int>()
//    @State var myFloatStack = MyFloatStack()
    
    var body: some View {
        VStack {
            TextField("숫자를 입력해주세요", text: $input)
            Button {
                myStack.insertValue(input: Int(input) ?? 0)
            } label: {
                Text("저장")
            }
            Button {
                myStack.showData()
            } label: {
                Text("출력")
            }

        }
    }
}

struct MyStack<T> {
    var data: [T] = []
    
    mutating func insertValue(input: T) {
        data.append(input)
    }
    
    func showData() {
        data.forEach { item in
            print(item)
        }
    }
}

//struct MyFloatStack {
//    var data: [Float] = []
//
//    mutating func insertValue(input: Float) {
//        data.append(input)
//    }
//
//    func showData() {
//        data.forEach { item in
//            print(item)
//        }
//    }
//}

struct MyGeneric_Previews: PreviewProvider {
    static var previews: some View {
        MyGeneric()
    }
}
