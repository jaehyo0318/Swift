//
//  GreenViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/22.
//

import UIKit

struct People {
    let name: String
    let age: Int
}

class GreenViewController: UIViewController {
//    goNext
    
    
    
    var frieds: [People] = [
        People(name: "재효", age: 27)
    ]
    
    @IBOutlet weak var insertTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goNext" {
            let viewController = segue.destination as! BrownViewController
            viewController.inputName = insertTextField.text!
            viewController.friends = frieds
        }
    }
}
