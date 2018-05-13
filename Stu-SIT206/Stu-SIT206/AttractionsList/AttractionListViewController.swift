//
//  AttractionListViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit
import RealmSwift

class AttractionListViewController: BaseTableViewController {
    
    var dataSource:Results = { () -> Results<AttractionModel> in
        let realm = try! Realm()
        let result = realm.objects(AttractionModel.self)
        return result
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map List"
        print(dataSource)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



// MARK: - Delegate Method
extension AttractionListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ID = "identcell1"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: ID)
            cell?.selectionStyle = .none
        }
        let model = dataSource[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: model.image)
        cell?.textLabel?.text = model.name
        cell?.detailTextLabel?.text = model.location
        
        // Configure the cell...
//        cell.nameLabel.text = restaurants[indexPath.row].name
//        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
//        cell.thumbnailImageView.layer.cornerRadius = 30.0
//        cell.thumbnailImageView.clipsToBounds = true
//        cell.locationLabel.text = restaurants[indexPath.row].location
//        cell.typeLabel.text = restaurants[indexPath.row].type
        
//        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = MapViewController()
        vc.model = dataSource[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

