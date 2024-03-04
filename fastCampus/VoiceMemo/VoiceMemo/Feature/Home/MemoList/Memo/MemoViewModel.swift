//
//  MemoViewModel.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/27.
//

import Foundation

class MemoViewModel: ObservableObject {
    @Published var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
    }
}
