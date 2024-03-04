//
//  BrownViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/22.
//

import UIKit

class BrownViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    var inputName: String = ""
    var friends: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = friends.first?.name
    }
    


}
