//
//  NavigationController.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import UIKit

class NavigationController: UINavigationController {

    override var childForStatusBarStyle: UIViewController? {
        self.topViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
