//
//  HomeViewModel.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import Foundation

@MainActor class HomeViewModel {
    
    private(set) var home: Home?
    
    let recommendViewModel: HomeRecommendViewModel = .init()
    var dataChnaged: (() -> Void)?
    
    func requestData() {
        Task {
            do {
                let home = try await DataLoader.load(url: URLDefines.home, for: Home.self)
                self.home = home
                self.recommendViewModel.recommends = home.recommends
                self.dataChnaged?()
            } catch {
                print("json parsing failed: \(error.localizedDescription)")
            }
        }
    }
}
