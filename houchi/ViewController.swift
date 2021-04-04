//
//  ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/11/06.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var level: Int = 1
    var maibilyou: Int = 3
    var timer: Timer?
    var cost: Int = 0
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       let appDomain = Bundle.main.bundleIdentifier
//        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        let shozikinn = UserDefaults.standard.object(forKey: "shozikinn")
        if shozikinn == nil {
            // UserDefaultsに所持金を保存するために初期化
            UserDefaults.standard.set(0, forKey: "shozikinn")
        }

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        
       level = UserDefaults.standard.integer(forKey: "level")
       if level == 0 {
           UserDefaults.standard.set(1, forKey: "level")
        }
        f.text = String(level)
        maibilyou = 3 * level
        a.text = "毎秒　\(String(maibilyou))"
        cost = maibilyou * 25
        g.text = "\(String(cost))円"
        
		
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
        // UserDefaultsから所持金を取り出す
        var shozikinn = UserDefaults.standard.object(forKey: "shozikinn") as! Int
        if shozikinn >= 10000000 {
            timer?.invalidate()
        } else {
            // 所持金をプラスして保存
            shozikinn = shozikinn + maibilyou
            UserDefaults.standard.set(shozikinn, forKey: "shozikinn")
            d.text = "\(String(shozikinn))円"
        }
    }
    
    @IBAction func levelUp() {
        var shozikinn = UserDefaults.standard.object(forKey: "shozikinn") as! Int
        if shozikinn >= cost {
            // 所持金を引いて保存
            shozikinn = shozikinn - cost
            UserDefaults.standard.set(shozikinn, forKey: "shozikinn")
            level = level + 1
            maibilyou = 3 * level
            cost = maibilyou * 25
            UserDefaults.standard.set(level, forKey: "level")
            f.text = String(level)
            g.text = "\(String(cost))円"
            a.text = "毎秒 　\(String(maibilyou))"
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



