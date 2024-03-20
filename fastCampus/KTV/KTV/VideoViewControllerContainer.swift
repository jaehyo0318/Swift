//
//  VideoViewControllerContainer.swift
//  KTV
//
//  Created by  서재효 on 3/20/24.
//

import Foundation

protocol VideoViewControllerContainer {
    var videoViewController: VideoViewController? { get }
    func presentCurrentViewController()
}
