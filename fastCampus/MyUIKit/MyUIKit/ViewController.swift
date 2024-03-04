//
//  ViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didMyButtonTapped(_ sender: Any) {
        myLabel.text = "Hello Karina!!"
    }
    
}

