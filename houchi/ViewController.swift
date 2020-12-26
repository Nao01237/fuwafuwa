//
//  ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/11/06.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shozikinn: Int = 0
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
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        a.text = "毎秒  \(String(maibilyou))"
        g.text = "\(String(maibilyou * 3))円"
        
    }
    @objc func count() {
        if shozikinn >= 100000 {
            timer?.invalidate()
        } else {
            shozikinn = shozikinn + maibilyou
            d.text = "\(String(shozikinn))円"
        }
        
        
    }
    @IBAction func levelUp() {
        if shozikinn >  maibilyou * 3 {
            shozikinn = shozikinn - maibilyou
            level = level + 1
            maibilyou = (maibilyou + 10) * 3
            f.text = String(level)
            g.text = "\(String(maibilyou * 3))円"
            a.text = "毎秒 　\(String(maibilyou))"
            
            
            
            
        }
        
        
    }
    
    
}




