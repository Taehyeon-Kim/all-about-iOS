//
//  AppDelegate.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var emptyView: UIView?
    
    func application(_ application: UIApplication,
                      supportedInterfaceOrientationsFor window: UIWindow?)
                      -> UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
                     -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
//        print("App will resign active. - 포그라운드 -> 백그라운드 상태")
        
        emptyView = UIView(frame: window!.frame)
        emptyView?.backgroundColor = .black
        window?.addSubview(emptyView!)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
//        print("App did enter background state. - 앱 백그라운드 상태(다른 앱 실행)")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
//        print("App will enter foreground. - 앱 포그라운드로 돌아오기 바로 전!")
        
        let alert = UIAlertController(title: "이어서 하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "네", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        print("App did become active. - 앱 활성화 된 상태")
        
        if emptyView != nil {
            emptyView?.removeFromSuperview()
            emptyView = nil
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
//        print("App will terminate. - 앱 종료시킨 상태")
    }
}

