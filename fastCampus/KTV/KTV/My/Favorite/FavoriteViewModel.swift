//
//  FavoriteViewModel.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import Foundation

@MainActor class FavoriteViewModel {
    private(set) var favorite: Favorite?
    var dataChanged: (() -> Void)?
    
    func request() {
        Task {
            do {
                let favorite = try await DataLoader.load(
                    url: URLDefines.favorite,
                    for: Favorite.self
                )
                self.favorite = favorite
                self.dataChanged?()
            } catch {
                print("favorite load failed: \(error.localizedDescription)")
            }
        }
    }
}
