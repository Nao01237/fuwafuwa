//
//  ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/11/06.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
    var shops: [Shop]?
    var user: User?
    var timer: Timer?
    @IBOutlet var a: UILabel!
    @IBOutlet var b: UILabel!
    @IBOutlet var c: UILabel!
    @IBOutlet var d: UILabel!
    @IBOutlet var e: UILabel!
    @IBOutlet var f: UILabel!
    @IBOutlet var g: UILabel!
	@IBOutlet var fukubukuroButton: UIButton!
	@IBOutlet var shopButton: UIButton!
    @IBOutlet var kaihouButton: UIButton!
    @IBOutlet var shopImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = realm.objects(User.self).first
        
        shops = Array(realm.objects(Shop .self).sorted(byKeyPath: "id", ascending: true))
        
        shopImage.image = UIImage(named: shops![0].unlockedImage)
        
        b.text =  shops![0].name
        
        f.text = String(shops![0].level)
        
        g.text = String(shops![0].cost)
        
        a.text =  String(shops![0].maibyou)


        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        
        guard let user = user else {
            fatalError("error")
        }
        f.text = String(user.level)
        a.text = "毎秒　\(String(user.maibyou))"
        g.text = "\(String(user.cost))円"
        
        
       
       
        
		
		// ここから追加！
		let fukubukuroClose: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(closeMenu(_:)))
		fukubukuroClose.direction = .left
		let shopClose: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(closeMenu(_:)))
		shopClose.direction = .left
		fukubukuroButton.addGestureRecognizer(fukubukuroClose)
		shopButton.addGestureRecognizer(shopClose)
		
		let fukubukuroOpen: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(openMenu(_:)))
		fukubukuroOpen.direction = .right
		let shopOpen: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(openMenu(_:)))
		shopOpen.direction = .right
		fukubukuroButton.addGestureRecognizer(fukubukuroOpen)
		shopButton.addGestureRecognizer(shopOpen)
    }
    
    @objc func count() {
        guard let user = user else {
        fatalError("user not found")
        }
        
        
        if user.shozikin >= 10000000 {
            timer?.invalidate()
        } else {
            try!realm.write() {
                user.shozikin += user.maibyou
                 user.shozikin = user.shozikin + user.maibyou
            }
           
            d.text = "\(String(user.shozikin))円"
        }
    }
    
    @IBAction func levelUp() {
        guard let user = user else {
            fatalError("user not found")
        }
        if user.shozikin >= user.cost {
            let level = user.level + 1
            let maibyou = level * 3
            let cost = maibyou * 25
            
            try! realm.write() {
                user.shozikin -= user.cost
                user.level = level
                user.maibyou = maibyou
                user.cost = cost
            }
            
            
            f.text = String(user.level)
            g.text = "\(String(user.cost))円"
            a.text = "毎秒 　\(String(user.maibyou))"
        }
    }
	
	// ここから追加！
	@objc func closeMenu(_ sender: UISwipeGestureRecognizer) {
		UIView.animate(withDuration: 0.5, animations: {
			self.fukubukuroButton.center.x = -40
			self.shopButton.center.x = -40
            self.kaihouButton.center.x = -40
		}, completion: {_ in
		})
	}
	
	@objc func openMenu(_ sender: UISwipeGestureRecognizer) {
		UIView.animate(withDuration: 0.5, animations: {
			self.fukubukuroButton.center.x = 50
			self.shopButton.center.x = 50
            self.kaihouButton.center.x = 50
		}, completion: {_ in
		})
	}
   
}



