//
//  MapViewController.swift
//  Stu-SIT206
//
//  Created by Chin Wai Pun on 2018/5/13.
//  Copyright © 2018年 cpwu. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class MapViewController: BaseViewController {
    
    var bgScrollView:UIScrollView = {
       let sc = UIScrollView()
        return sc
    }()
    
    var img = UIImageView()
    
    var model: AttractionModel!
    
    
    
    var mapView: MKMapView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        self.view.addSubview(self.bgScrollView)
        self.edgesForExtendedLayout = .init(rawValue: 0)
        bgScrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        bgScrollView.addSubview(img)
        img.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(250)
        }

        
        img.image = UIImage(named: model.image)
        
        //Name
        let namel = UILabel()
        namel.text = "Name:"
        
        let namer = UILabel()
        namer.text = model.name
        
        bgScrollView.addSubview(namel)
        bgScrollView.addSubview(namer)
        
        namel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(img.snp.bottom).offset(15)
        }
        
        namer.snp.makeConstraints { (make) in
            make.left.equalTo(namel.snp.right).offset(5)
            make.centerY.equalTo(namel)
        }
        
        
        //Type
        let typel = UILabel()
        typel.text = "Type:"
        
        let typer = UILabel()
        typer.text = model.type
        
        bgScrollView.addSubview(typel)
        bgScrollView.addSubview(typer)
        
        typel.snp.makeConstraints { (make) in
            make.left.equalTo(namel)
            make.top.equalTo(namel.snp.bottom).offset(10)
        }
        
        typer.snp.makeConstraints { (make) in
            make.centerY.equalTo(typel)
            make.left.equalTo(typel.snp.right).offset(5)
        }
        
        
        //Location
        let phonel = UILabel()
        phonel.text = "Call:"
        
        let phoner = UIButton()
        phoner.setTitle(model.phone, for: .normal)
        phoner.setTitleColor(UIColor.blue, for: .normal)
        phoner.addTarget(self, action: #selector(call), for: .touchUpInside)
        
        bgScrollView.addSubview(phonel)
        bgScrollView.addSubview(phoner)
        
        phonel.snp.makeConstraints { (make) in
            make.left.equalTo(typel)
            make.top.equalTo(typel.snp.bottom).offset(10)
        }
        
        phoner.snp.makeConstraints { (make) in
            make.centerY.equalTo(phonel)
            make.left.equalTo(phonel.snp.right).offset(5)
        }
        
        let bgview = UIView()
        bgview.layer.borderColor = UIColor.black.cgColor
        bgview.layer.borderWidth = 1
        bgScrollView.addSubview(bgview)
        bgview.snp.makeConstraints { (make) in
            make.top.equalTo(namel.snp.top).offset(-5)
            make.left.equalTo(namel.snp.left).offset(-3)
            make.width.equalTo(UIScreen.main.bounds.width - 26)
            make.bottom.equalTo(phonel.snp.bottom).offset(5)
        }
        
        
        
        
        //Add To Day Plan
        let dayplanl = UILabel()
        dayplanl.text = "Add To Day Plan"
        
        bgScrollView.addSubview(dayplanl)
        dayplanl.snp.makeConstraints { (make) in
            make.left.equalTo(phonel)
            make.top.equalTo(phonel.snp.bottom).offset(20)
        }
        
        let DayPlanSwitch = UISwitch()
        DayPlanSwitch.isOn = model.isVisited
        bgScrollView.addSubview(DayPlanSwitch)
        DayPlanSwitch.snp.makeConstraints { (make) in
            make.right.equalTo(bgview)
            make.centerY.equalTo(dayplanl)
        }
        
        
        DayPlanSwitch .addTarget(self, action: #selector(dayPlanChange), for: .valueChanged)
        
        
        
        
        
        self.mapView = MKMapView()
        self.bgScrollView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(dayplanl.snp.bottom).offset(40)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(300)
            make.bottom.equalToSuperview().offset(-44)
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tapGestureRecognizer)
        
//        let directionView = UIView()
//        directionView.backgroundColor = .white
//        self.view.addSubview(directionView)
//        directionView.snp.makeConstraints { (make) in
//            make.left.bottom.right.equalToSuperview()
//            make.height.equalTo(44)
//        }
        
//        let directionButton = UIButton()
//        directionButton .setTitle("Click to get direction", for: .normal)
//        directionButton.setTitleColor(UIColor.blue, for: .normal)
//        directionView.addSubview(directionButton)
//        directionButton.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(self.model.location) { (placemarks, error) in
                if error != nil {
                    print(error as Any)
                    return
                }
                
                if let placemarks = placemarks {
                    
                    let placepark = placemarks[0]
                    
                    let annotation = MKPointAnnotation()
                    
                    if let location = placepark.location {
                        annotation.coordinate = location.coordinate
                        self.mapView.addAnnotation(annotation)
                        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                        self.mapView .setRegion(region, animated: true)
                        
                    }
                    
                    
                }
                
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dayPlanChange(sender: UISwitch){
        
        if sender.isOn {
            let alert = UIAlertController(title: "Reminder", message: "Add To Day Plans?", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { (alert) in
                let reaml = try! Realm()
                try! reaml.write {
                    self.model.isVisited = sender.isOn
                }
            }
            
            let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
                sender.isOn = false
            }
            alert.addAction(actionOK)
            alert.addAction(actionCancel)
            self.present(alert, animated: true, completion: nil)
        }else {
            let reaml = try! Realm()
            try! reaml.write {
                self.model.isVisited = sender.isOn
            }
        }
        
        
        
       
        
    }
    
    @objc func call() {
        UIApplication.shared.open(URL(string: "tel://" + model.phone)!, options: [:], completionHandler: nil)
    }
    
    @objc func showMap() {
        let mapdetail = MapDetailViewController()
        mapdetail.restaurant = self.model
        self.navigationController?.pushViewController(mapdetail, animated: true)
        
    }

}
