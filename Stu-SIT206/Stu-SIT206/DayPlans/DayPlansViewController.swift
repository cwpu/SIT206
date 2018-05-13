//
//  DayPlansViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/13.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit
import RealmSwift

class DayPlansViewController: BaseTableViewController {

    var dataSource:Results<AttractionModel> = {
        let reaml = try! Realm()
        let p1 = NSPredicate(format: "isVisited = true")
        
        let result = reaml.objects(AttractionModel.self).filter(p1)
        return result
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Day Plans"
        self.tableView?.register(UINib(nibName: "PlansTableViewCell", bundle: nil), forCellReuseIdentifier: "cccc")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData() {
        let reaml = try! Realm()
        let p1 = NSPredicate(format: "isVisited = true")
        
        let result = reaml.objects(AttractionModel.self).filter(p1)
        self.dataSource = result
        self.tableView?.reloadData()
    }
    
}

extension DayPlansViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cccc", for: indexPath) as! PlansTableViewCell
        
        let model = self.dataSource[indexPath.row]
        
        cell.model = model
        cell.itemDidBlock = {(isOn) in
            
            let alert = UIAlertController(title: "Reminder", message: "This is an alert for you visit", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                let reaml = try! Realm()
                try! reaml.write {
                    model.isVisited = isOn
                }
                self.getData()
            })
            
            let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
                self.getData()
            })
            
            alert.addAction(actionOK)
            alert.addAction(actionCancel)
            self .present(alert, animated: true, completion: nil)
            
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
