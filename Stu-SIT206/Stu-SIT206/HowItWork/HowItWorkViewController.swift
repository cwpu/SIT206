//
//  HowItWorkViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/12.
//  Copyright © 2018年 cwpu. All rights reserved.
//

import UIKit
import SnapKit
import VGPlayer

class HowItWorkViewController: BaseViewController,VGPlayerDelegate,VGPlayerViewDelegate {

    let player: VGPlayer = VGPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "How It Works"
        //Add Title Label
        let titleLb = UILabel()
        titleLb.text = "How It Works"
        titleLb.font = UIFont.boldSystemFont(ofSize: 40)
        self.view.addSubview(titleLb)
        titleLb.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(85)
        }
        
        
        // Add Player
        //video uploaded to online storage mixtape.moe
        player.replaceVideo(URL(string: "https://my.mixtape.moe/rrvovg.mp4")!)
        player.play()
        player.backgroundMode = .proceed
        player.delegate = self
        player.displayView.delegate = self
        player.displayView.titleLabel.text = "How It Works"
        self.view.addSubview(player.displayView)
        player.displayView.snp.makeConstraints { [weak self] (make) in
            guard let strongSelf = self else { return }
            make.top.equalTo(titleLb.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(strongSelf.view.snp.width).multipliedBy(3.0/4.0)
        }
        
        // Add Desc
        let desc = UILabel()
        desc.numberOfLines = 0
        desc.text = "This is a demo video to show how does this app works"
        self.view.addSubview(desc)
        desc.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(15)
            make.top.equalTo(self.player.displayView.snp.bottom).offset(30)
        }
        
        
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
