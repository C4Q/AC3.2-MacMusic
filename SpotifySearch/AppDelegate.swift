//
//  AppDelegate.swift
//  SpotifySearch
//
//  Created by Cris on 10/28/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /*
        if let spotifyLogin = UserDefaults.standard.value(forKey: "spotifyLoginInfo") as? [String:String] {
            if let clientID = spotifyLogin["client_id"],
                let clientSecret = spotifyLogin["client_secret"],
                let accessToken = spotifyLogin["access_token"] {
                SpotifyOAuthManager.configure(clientID: clientID, clientSecret: clientSecret, accessToken: accessToken)
                print(SpotifyOAuthManager.configure(clientID: clientID, clientSecret: clientSecret, accessToken: accessToken))
            }
            return true
        }
         */
        let clientID = ""
        let clientSecret = ""
        let redirectURL =  "macmusic://auth.url"
        
        SpotifyOAuthManager.configure(clientID: clientID, clientSecret: clientSecret)
        do {
            //get user and get repo while nothing else
            //request specific information
            try SpotifyOAuthManager.shared.requestAuthorization(scopes: [.user_library_read, .user_library_modify])
        } catch {
            print("Error: \(error)")
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if let sendingApp = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String {
            if sendingApp == "com.apple.mobilesafari"{ //used to be "Safari.app"
                SpotifyOAuthManager.shared.requestAuthToken(url: url)
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

