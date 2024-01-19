//
//  ViewController.swift
//  HelloSwiftProject
//
//  Created by  서재효 on 2023/12/03.
//

import UIKit

class ViewController: UIViewController {

    
    /*
     단축키
     opt+클릭
     라이브러리: cmd+shift+l
     Run: cmd+r
     */
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBOutlet weak var inputField: UITextField!
    
    
    @IBAction func showValue(_ sender: Any) {
        let name = inputField.text!
        valueLabel.text = "Hello, \(name)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

