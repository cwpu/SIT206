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
    
    
    /// Init Realm DataBase
    func creatRealm()  {
        var config = Realm.Configuration()
        
        //Config DataBase url
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("sit206.realm")
        
       
        
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    /// Init Data
    func addDatabaseData() {
        
        let reaml = try! Realm()
        
        if reaml.objects(AttractionModel.self).count != 0 {return}
        
        let model = AttractionModel()
        model.name = "Cafe Deadend"
        model.type = "Coffee & Tea Shop"
        model.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
        model.phone = "232-923423"
        model.image = "cafedeadend.jpg"
        model.isVisited = false
        
        let model1 = AttractionModel()
        model1.name = "Homei"
        model1.type = "Cafe"
        model1.location = "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong"
        model1.phone = "348-233423"
        model1.image = "homei.jpg"
        model1.isVisited = false
        
        let model2 = AttractionModel()
        model2.name = "Teakha"
        model2.type = "Tea House"
        model2.location = "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong"
        model2.phone = "354-243523"
        model2.image = "teakha.jpg"
        model2.isVisited = false
        
        let model3 = AttractionModel()
        model3.name = "Cafe loisl"
        model3.type = "Austrian / Causual Drink"
        model3.location = "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong"
        model3.phone = "453-333423"
        model3.image = "cafeloisl.jpg"
        model3.isVisited = false
        
        let model4 = AttractionModel()
        model4.name = "Petite Oyster"
        model4.type = "French"
        model4.location = "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong"
        model4.phone = "983-284334"
        model4.image = "petiteoyster.jpg"
        model4.isVisited = false
       
        let model5 = AttractionModel()
        model5.name = "For Kee Restaurant"
        model5.type = "Bakery"
        model5.location = "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong"
        model5.phone = "232-434222"
        model5.image = "forkeerestaurant.jpg"
        model5.isVisited = false
        
        let model6 = AttractionModel()
        model6.name = "Po's Atelier"
        model6.type = "Bakery"
        model6.location = "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong"
        model6.phone = "234-834322"
        model6.image = "posatelier.jpg"
        model6.isVisited = false
        
        let model7 = AttractionModel()
        model7.name = "Bourke Street Backery"
        model7.type = "Chocolate"
        model7.location = "633 Bourke St Sydney New South Wales 2010 Surry Hills"
        model7.phone = "982-434343"
        model7.image = "bourkestreetbakery.jpg"
        model7.isVisited = false
        
        let model8 = AttractionModel()
        model8.name = "Haigh's Chocolate"
        model8.type = "Cafe"
        model8.location = "412-414 George St Sydney New South Wales"
        model8.phone = "734-232323"
        model8.image = "cafedeadend.jpg"
        model8.isVisited = false
        
        let model9 = AttractionModel()
        model9.name = "CASK Pub and Kitchen"
        model9.type = "Thai"
        model9.location = "22 Charlwood Street London SW1V 2DY Pimlico"
        model9.phone = "432-344050"
        model9.image = "caskpubkitchen.jpg"
        model9.isVisited = false
        
        let model10 = AttractionModel()
        model10.name = "Royal Oak"
        model10.type = "British"
        model10.location = "2 Regency Street London SW1P 4BZ United Kingdom"
        model10.phone = "343-988834"
        model10.image = "royaloak.jpg"
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

        
//        var model11 = AttractionModel()
//        model11.name = "Cafe Deadend"
//        model11.type = "Coffee & Tea Shop"
//        model11.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model11.phone = "232-923423"
//        model11.image = "cafedeadend.jpg"
//        model11.isVisited = false
//
//        var model12 = AttractionModel()
//        model12.name = "Cafe Deadend"
//        model12.type = "Coffee & Tea Shop"
//        model12.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model12.phone = "232-923423"
//        model12.image = "cafedeadend.jpg"
//        model12.isVisited = false
//
//        var model13 = AttractionModel()
//        model13.name = "Cafe Deadend"
//        model13.type = "Coffee & Tea Shop"
//        model13.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model13.phone = "232-923423"
//        model13.image = "cafedeadend.jpg"
//        model13.isVisited = false
//
//        var model14 = AttractionModel()
//        model14.name = "Cafe Deadend"
//        model14.type = "Coffee & Tea Shop"
//        model14.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model14.phone = "232-923423"
//        model14.image = "cafedeadend.jpg"
//        model14.isVisited = false
//
//        var model15 = AttractionModel()
//        model15.name = "Cafe Deadend"
//        model15.type = "Coffee & Tea Shop"
//        model15.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model15.phone = "232-923423"
//        model15.image = "cafedeadend.jpg"
//        model15.isVisited = false
//
//        var model16 = AttractionModel()
//        model16.name = "Cafe Deadend"
//        model16.type = "Coffee & Tea Shop"
//        model16.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model16.phone = "232-923423"
//        model16.image = "cafedeadend.jpg"
//        model16.isVisited = false
//
//        var model17 = AttractionModel()
//        model17.name = "Cafe Deadend"
//        model17.type = "Coffee & Tea Shop"
//        model17.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model17.phone = "232-923423"
//        model17.image = "cafedeadend.jpg"
//        model17.isVisited = false
//
//        var model18 = AttractionModel()
//        model18.name = "Cafe Deadend"
//        model18.type = "Coffee & Tea Shop"
//        model18.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model18.phone = "232-923423"
//        model18.image = "cafedeadend.jpg"
//        model18.isVisited = false
//
//        var model19 = AttractionModel()
//        model19.name = "Cafe Deadend"
//        model19.type = "Coffee & Tea Shop"
//        model19.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
//        model19.phone = "232-923423"
//        model19.image = "cafedeadend.jpg"
//        model19.isVisited = false
        
        
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

