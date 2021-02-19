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
    @IBOutlet var a: UILabel!
    @IBOutlet var b: UILabel!
    @IBOutlet var c: UILabel!
    @IBOutlet var d: UILabel!
    @IBOutlet var e: UILabel!
    @IBOutlet var f: UILabel!
    @IBOutlet var g: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let shozikinn = UserDefaults.standard.object(forKey: "shozikinn")
        if shozikinn != nil {
        } else {
            // UserDefaultsに所持金を保存するために初期化
                  UserDefaults.standard.set(0, forKey: "shozikinn")
        
    }
      
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        a.text = "毎秒  \(String(maibilyou))"
        g.text = "\(String(maibilyou * 25))円"
        let l = UserDefaults.standard.object(forKey: "level")
        if l != nil {
            level = l as! Int
        } else {
        }
        f.text = String(level)
        maibilyou = 3 * level
        a.text = "毎秒　\(String(maibilyou))"
        g.text = "\(String(level * 25))円"
        
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
        if shozikinn >  maibilyou * 25 {
            // 所持金を引いて保存
            shozikinn = shozikinn - maibilyou
            UserDefaults.standard.set(shozikinn, forKey: "shozikinn")
            level = level + 1
            maibilyou = (maibilyou + 10) * 2
            UserDefaults.standard.set(level, forKey: "level")
            f.text = String(level)
            g.text = "\(String(maibilyou * 25))円"
            a.text = "毎秒 　\(String(maibilyou))"
        }
    }
}




