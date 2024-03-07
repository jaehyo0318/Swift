//
//  HomeViewModel.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import Foundation

class HomeViewModel {
    
    private(set) var home: Home?
    var dataChnaged: (() -> Void)?
    
    func requestData() {
        Task {
            do {
                self.home = try await DataLoader.load(url: URLDefines.home, for: Home.self)
                self.dataChnaged?()
            } catch {
                print("json parsing failed: \(error.localizedDescription)")
            }
        }
    }
}
