//
//  SearchDataController.swift
//  LMessenger
//
//  Created by  서재효 on 5/7/24.
//

import Foundation
import CoreData


class SearchDataController: ObservableObject {
    let persistantContainer = NSPersistentContainer(name: "Search")
    
    init() {
        persistantContainer.loadPersistentStores { description, error in
            if let error {
                print("Core data failed ", error)
            }
        }
    }
}
