//
//  ProfileDetailViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/22.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var inputText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = inputText
    }
    

    

}
