//
//  MyViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/20.
//

import UIKit


protocol AdminDelegate {
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        admin = Admin(delegate: self)        
    }
    

    @IBAction func didTabButton(_ sender: Any) {
        if let name = nameTextField.text {
            helloLabel.text =  "Hello \(name)!"
        }
        admin?.delegate.doTask()
        
    }
    

}

extension MyViewController: AdminDelegate {
    func doTask() {
        print("저 지금 일 잘하고 있습니다!")
    }
    
}

struct Admin {
    var delegate: AdminDelegate
}
