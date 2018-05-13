//
//  AttractionModel.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit
import RealmSwift

class AttractionModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var type = ""
    @objc dynamic var location = ""
    @objc dynamic var image = ""
    @objc dynamic var isVisited = false
    @objc dynamic var phone = ""
    @objc dynamic var rating = ""
}
