//
//  HomeViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {
    
    lazy var dataSource:[String] = {
       return [
        "Main Attraction",
        "Day Plans",
        "Emergency Contacts",
        "How It Works",
        "Developer Info"
        ]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Guide"
        creatTableHeadView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


// MARK: - Delegate Method
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textAlignment = .center;
        cell.selectionStyle = .none
        return cell        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0://Main
            print("Main")
        case 1://Day Plans
            print("Day")
        case 2:
            self.navigationController?.pushViewController(EmergencyViewController(), animated: true)
            print("Emer")
        case 3:
            self.navigationController?.pushViewController(HowItWorkViewController(), animated: true)
            print("How")
        case 4:
            self.navigationController?.pushViewController(DeveloperViewController(), animated: true)
            print("Deve")
        default:
            print("None")
        }
    }
}

// MARK: - HeadView
extension HomeViewController {
    
    func creatTableHeadView() {
        let headView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 180))
        headView.image = UIImage(named: "logo")
        self.tableView?.tableHeaderView = headView
    }
}
