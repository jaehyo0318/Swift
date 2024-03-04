//
//  PathType.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/26.
//

import Foundation

enum PathType: Hashable {
    case homeView
    case todoView
    case memoView(isCreatedMode: Bool, memo: Memo?)
}
