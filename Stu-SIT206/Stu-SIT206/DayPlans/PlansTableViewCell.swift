//
//  PlansTableViewCell.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/13.
//  Copyright © 2018年 cwpu. All rights reserved.
//

import UIKit

class PlansTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    //this is used to connect with things in UI including Image, Label, Switch
    var itemDidBlock:((Bool) -> Void)?
    
    
    var model:AttractionModel! {
        didSet {
            self.img.image = UIImage(named: model.image)
            self.content.text = model.name
            self.switch.isOn = model.isVisited
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func changeState(_ sender: UISwitch) {
        if itemDidBlock != nil {
            itemDidBlock!(sender.isOn)
        }
    }
}
