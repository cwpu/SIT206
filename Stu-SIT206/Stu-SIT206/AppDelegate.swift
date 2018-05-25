//
//  AppDelegate.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Set Root ViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = BaseNavViewController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        
        creatRealm()
        addDatabaseData()
        return true
    }
    
    
    // Initial Realm DataBase
    func creatRealm()  {
        var config = Realm.Configuration()
        
        //Config DataBase url
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("sit206.realm")
        
       
        
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    // set up the attraction Data
    func addDatabaseData() {
        
        let reaml = try! Realm()
        
        if reaml.objects(AttractionModel.self).count != 0 {return}
        
        let model = AttractionModel()
        model.name = "Flinders Street Station"
        model.type = "Station"
        model.location = "Flinders St, Melbourne VIC 3000"
        model.phone = "(03) 9610 7476"
        model.image = "Flinders.jpg"
        model.isVisited = false
        
        let model1 = AttractionModel()
        model1.name = "Federation Square"
        model1.type = "Visit Point"
        model1.location = "Swanston St & Flinders St, Melbourne VIC 3000"
        model1.phone = "(03) 9655 1900"
        model1.image = "Federation.jpg"
        model1.isVisited = false
        
        let model2 = AttractionModel()
        model2.name = "Royal Botanic Gardens Victoria"
        model2.type = "Garden"
        model2.location = "Birdwood Ave, South Yarra VIC 3141"
        model2.phone = "(03) 9252 2300"
        model2.image = "Royal.jpg"
        model2.isVisited = false
        
        let model3 = AttractionModel()
        model3.name = "Queen Victoria Market"
        model3.type = "Market"
        model3.location = "Queen St, Melbourne VIC 3000"
        model3.phone = "(03) 9320 5822"
        model3.image = "Queen.jpg"
        model3.isVisited = false
        
        let model4 = AttractionModel()
        model4.name = "Sea Life Melbourne"
        model4.type = "Visit Point"
        model4.location = "King St, Melbourne VIC 3000"
        model4.phone = "1800 026 576"
        model4.image = "Sea.jpg"
        model4.isVisited = false
       
        let model5 = AttractionModel()
        model5.name = "Shrine of Remembrance"
        model5.type = "Visit Point"
        model5.location = "Birdwood Ave, Melbourne VIC 3001"
        model5.phone = "(03) 9661 8100"
        model5.image = "Shrine.jpg"
        model5.isVisited = false
        
        let model6 = AttractionModel()
        model6.name = "State Library Victoria"
        model6.type = "Library"
        model6.location = "328 Swanston St, Melbourne VIC 3000"
        model6.phone = "(03) 8664 7000"
        model6.image = "Library.jpg"
        model6.isVisited = false
        
        let model7 = AttractionModel()
        model7.name = "Old Melbourne Gaol"
        model7.type = "Visit Point"
        model7.location = "377 Russell St, Melbourne VIC 3000"
        model7.phone = "(03) 9656 9889"
        model7.image = "Gaol.jpg"
        model7.isVisited = false
        
        let model8 = AttractionModel()
        model8.name = "St Paul’s Cathedral Melbourne"
        model8.type = "Visit Point"
        model8.location = "Flinders Ln & Swanston St, Melbourne VIC 3000"
        model8.phone = "(03) 9653 4333"
        model8.image = "Cathedral.jpg"
        model8.isVisited = false
        
        let model9 = AttractionModel()
        model9.name = "Chinatown Melbourne"
        model9.type = "Visit Point"
        model9.location = "Little Bourke St, Melbourne VIC 3000"
        model9.phone = "(03) 9067 1234"
        model9.image = "Chinatown.jpg"
        model9.isVisited = false
        
        let model10 = AttractionModel()
        model10.name = "Great Ocean Road Tourist Park"
        model10.type = "Visit Point"
        model10.location = "Great Ocean Road Tourist Park, Great Ocean Road,"
        model10.phone = "(03) 5598 5477"
        model10.image = "Great.jpg"
        model10.isVisited = false
       
        try! reaml.write {
            reaml.add(model)
            reaml.add(model1)
            reaml.add(model2)
            reaml.add(model3)
            reaml.add(model4)
            reaml.add(model5)
            reaml.add(model6)
            reaml.add(model7)
            reaml.add(model8)
            reaml.add(model9)
            reaml.add(model10)
        }

        
        
        
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

