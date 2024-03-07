//
//  UIImageView.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: URL) -> Task<Void, Never> {
        return .init{
            guard
                let responseData = try? await URLSession.shared.data(for: .init(url: url)).0,
                let image = UIImage(data: responseData)
            else {
                return
            }
            self.image = image
        }
    }
}
