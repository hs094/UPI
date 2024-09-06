//
//  AppDelegate.swift
//  UPI Pay
//
//  Created by Kshitiz Sharma on 24/01/21.
//

import UIKit
//import OSLog

@available(iOS 14.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

//    let logger = Logger(subsystem: "blindPolaroid.Page.UPI-Pay.AppDelegate", category: "BTP")
    var window: UIWindow?
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
                print("Permission granted: \(granted)")
            }
    }
    func extractUserInfo(userInfo: [AnyHashable : Any]) -> (title: String, body: String) {
        var info = (title: "", body: "")
        guard let aps = userInfo["aps"] as? [String: Any] else { return info }
        guard let alert = aps["alert"] as? [String: Any] else { return info }
        let title = alert["title"] as? String ?? ""
        let body = alert["body"] as? String ?? ""
        info = (title: title, body: body)
        return info
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func addLog(logStr: String) {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var str = format.string(from: Date()) + ": " +  logStr + "\n"
        let filename = self.getDocumentsDirectory().appendingPathComponent("outputLog.txt")
        do {
            let oldString = try String(contentsOf: filename, encoding: String.Encoding.utf8)
            str = oldString + str
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("ERROR in adding log string: \(str)")
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("received notification tap")
//        logger.notice("AppDelegate received notification tap in UPI-Pay")
        addLog(logStr: "AppDelegate received notification tap in UPI-Pay")
//        let info = self.extractUserInfo(userInfo: userInfo)
//        if info.title == "Payment Request"{
//            if let navvc = self.window?.rootViewController as? UINavigationController{
//                print("found navvc")
//                if let vc = navvc.viewControllers.first as? HomePageViewController{
//                    vc.handleReceiveMoneyRequest(person: PersonInfo(number: 111, name: "air", image: "image", verifications: .unknown), message: "receieve req msg", value: 100)
//                }
//            }
//        }
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        registerForPushNotifications()
        return true
    }
    
    //    This step will allow your app to show Push Notification even when your app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        let info = self.extractUserInfo(userInfo: userInfo)
//        logger.notice("AppDelegate received notification titled: \(info.title) in UPI-Pay")
        addLog(logStr: "AppDelegate received notification titled: \(info.title) in UPI-Pay")
        if info.title == "Payment Request"{
            print(info.body)
            if let navvc = self.window?.rootViewController as? UINavigationController{
                print("found navvc")
                if let vc = navvc.viewControllers.first as? HomePageViewController{
                    if info.body=="Raj"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 9182589127, name: "Raj", image: "image", verifications: .suspected), message: "receieve req msg", value: 100, tohide: true)
                    }else if info.body=="Rohan"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 222, name: "Rohan", image: "image", verifications: .unknown), message: "receieve req msg", value: 100, tohide: true)
                    }else if info.body=="Payment Request From Jasbeer - Rs. 1500"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 980913482, name: "Jasbeer", image: "image", verifications: .verified), message: "Payment Request From Jasbeer - Rs. 1500", value: 1500, tohide: true)
                    }else if info.body=="Payment Request From Geet - Rs. 5000"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 904385093, name: "Geet", image: "image", verifications: .suspected), message: "You will receive 5000 Rs.", value: 5000, tohide: true)
                    }else if info.body=="Payment Request From Santosh - Rs. 5000"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 222, name: "Santosh", image: "image", verifications: .unknown), message: "You will receive 5000 Rs.", value: 5000, tohide: true)
                    }else if info.body=="Payment Request From Flipkart - Rs. 2500"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 8254086304, name: "Flipkart", image: "flipkart", verifications: .unknown), message: "You will receive 2500 Rs. cashback ", value: 2500, tohide: true)
                    }
                    else if info.body=="Payment Request From UPI Pay - Rs. 5000"{
                        vc.handleReceiveMoneyRequest(person: PersonInfo(number: 980913482, name: "UPI Pay", image: "image", verifications: .unknown), message: "You will invest 9000 Rs. using UPI Pay", value: 5000, tohide: true)
                    }
                    
                }
            }
        }

//        print(userInfo) // the payload that is attached to the push notification
        // you can customize the notification presentation options. Below code will show notification banner as well as play a sound. If you want to add a badge too, add .badge in the array.
        completionHandler([.alert,.sound])
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("URL: ", url)
        let qid = url.absoluteString.split(separator: "/")[1].split(separator: "?")[1]
        if qid == "14t3z"{
            if let navvc = self.window?.rootViewController as? UINavigationController{
                print("found navvc")
                if let vc = navvc.viewControllers.first as? HomePageViewController{
                    vc.handleReceiveMoneyRequest(person: PersonInfo(number: 111, name: "Raj", image: "image", verifications: .suspected), message: "receieve req msg", value: 100, tohide: false)
                }
            }
        }else if qid == "1qweio134nbf"{
            if let navvc = self.window?.rootViewController as? UINavigationController{
                //                print("found navvc")
                if let vc = navvc.viewControllers.first as? HomePageViewController{
                    vc.handleReceiveMoneyRequest(person: PersonInfo(number: 901489123, name: "Daya Textiles Ltd.", image: "image", verifications: .suspected), message: "Billing worth 1500 Rs to Daya Textiles Ltd.", value: 1500, tohide: false)
                }
            }
        }else if qid == "io5243uio77fh89"{
            if let navvc = self.window?.rootViewController as? UINavigationController{
                //                print("found navvc")
                if let vc = navvc.viewControllers.first as? HomePageViewController{
                    vc.handleReceiveMoneyRequest(person: PersonInfo(number: 901489123, name: "Daya Textiles Ltd.", image: "image", verifications: .suspected), message: "Billing worth 1500 Rs to Daya Textiles Ltd.", value: 2500, tohide: false)
                }
            }
        }

        return true
    }
    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

