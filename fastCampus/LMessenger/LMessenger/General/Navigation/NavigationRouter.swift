//
//  NavigationRouter.swift
//  LMessenger
//
//  Created by  서재효 on 5/1/24.
//

import Foundation

class NavigationRouter: ObservableObject {
    
    @Published var destinations: [NavigationDestination] = []
    
    func push(to view: NavigationDestination) {
        destinations.append(view)
    }
    
    func pop() {
        _ = destinations.popLast()
    }
    func popToRootView() {
        destinations = []
    }
}
