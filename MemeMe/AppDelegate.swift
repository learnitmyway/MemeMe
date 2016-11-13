//
//  AppDelegate.swift
//  MemeMe
//
//  Created by David  on 29/10/2016.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var sentMemes = [
        Meme(textTop: "I have something in my eye.", textBottom: "Not anymore!", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "I am so comfy right now.", textBottom: "Do you think they'll see me?", originalImage: UIImage(named: "d2")!, memeImage: UIImage(named: "d2")!),
        Meme(textTop: "We are free", textBottom: "and we know it!", originalImage: UIImage(named: "d3")!, memeImage: UIImage(named: "d3")!),
        Meme(textTop: "Honey, I told you", textBottom: "to jump on 3!", originalImage: UIImage(named: "d4")!, memeImage: UIImage(named: "d4")!),
        Meme(textTop: "Why is everyone scared of me?", textBottom: "I'm just looking for friends", originalImage: UIImage(named: "d5")!, memeImage: UIImage(named: "d5")!),
        Meme(textTop: "I am so stressed these days.", textBottom: "Thanks for giving me a massage.", originalImage: UIImage(named: "d6")!, memeImage: UIImage(named: "d6")!),
        Meme(textTop: "Damn.", textBottom: "I could go for a Quinoa salad", originalImage: UIImage(named: "d7")!, memeImage: UIImage(named: "d7")!),
        Meme(textTop: "This is my water hole,", textBottom: "Buddy!", originalImage: UIImage(named: "d9")!, memeImage: UIImage(named: "d9")!),
        Meme(textTop: "Man, it's hot today.", textBottom: "Here comes the boom!", originalImage: UIImage(named: "d8")!, memeImage: UIImage(named: "d8")!),
        Meme(textTop: "I want you to", textBottom: "nose me as hard as you can.", originalImage: UIImage(named: "d10")!, memeImage: UIImage(named: "d10")!),
        ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

