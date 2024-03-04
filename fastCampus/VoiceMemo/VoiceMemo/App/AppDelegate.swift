//
//  AppDelegate.swift
//  VoiceMemo
//


import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var notificationDelegate =  NotificationDelegate()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            UNUserNotificationCenter.current().delegate = notificationDelegate
            
            sleep(2)
            return true
    }
    
}
