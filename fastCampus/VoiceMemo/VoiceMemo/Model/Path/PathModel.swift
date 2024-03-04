//
//  PathModel.swift
//  VoiceMemo
//
//  Created by  서재효 on 2024/02/26.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
