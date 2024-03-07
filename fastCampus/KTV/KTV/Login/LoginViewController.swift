//
//  Login
// LoginViewController.swift
//  KTV
//
//  Created by  서재효 on 2024/03/04.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 19
        self.loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        self.loginButton.layer.borderWidth = 1
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        self.view.window?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
    }
    
}

