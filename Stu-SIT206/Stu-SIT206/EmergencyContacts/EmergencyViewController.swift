//
//  EmergencyViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit

class EmergencyViewController: BaseTableViewController {
    
    lazy var dataSource: [[String: String]] = {
       return [
        [
            "name" : "Name1",
            "phone" : "123456",
            ],
        [
            "name" : "Name2",
            "phone" : "234567",
        ]
        ]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Emerency Contacts"

        // Do any additional setup after loading the view.
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

}

// MARK: - Delegate Method
extension EmergencyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "identcell"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: ID)
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = self.dataSource[indexPath.row]["name"]
        cell?.detailTextLabel?.text = self.dataSource[indexPath.row]["phone"]
        cell?.imageView?.image = UIImage(named: "contact")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let phoneNum = self.dataSource[indexPath.row]["phone"] else {
            return
        }
        UIApplication.shared.open(URL(string: "tel://" + phoneNum)!, options: [:], completionHandler: nil)
        
    }
}
