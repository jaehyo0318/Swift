//
//  SplashViewController.swift
//  Cproject
//
//  Created by  서재효 on 10/15/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var lottieAnimationView: LottieAnimationView!
    
//    @IBOutlet weak var appIconCenterYConstaraint: NSLayoutConstraint!
//    @IBOutlet weak var appIconCenterXConstraint: NSLayoutConstraint!
//    
//    @IBOutlet weak var appIcon: UIImageView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        appIconCenterXConstraint.constant = -(view.frame.width / 2) - (appIcon.frame.width / 2)
        //        appIconCenterYConstaraint.constant = -(view.frame.height / 2) - (appIcon.frame.height / 2)
        //
        //        UIView.animate(withDuration: 1) {[weak self] in
        //            self?.view.layoutIfNeeded()
        //        } 천천히 날라가기
        
//        UIView.animate(withDuration: 3, animations: { [weak self] in
//            let rotationAngle: CGFloat = CGFloat.pi
//            self?.appIcon.transform = CGAffineTransform(rotationAngle: rotationAngle)
//        }) 회전
        
        
        lottieAnimationView.play()
    }
    
    
}
