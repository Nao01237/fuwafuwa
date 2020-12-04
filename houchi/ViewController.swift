//
//  ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/11/06.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number: Int = 0
    var level: Int = 1
    var timer: Timer?
    @IBOutlet var a: UILabel!
      @IBOutlet var b: UILabel!
      @IBOutlet var c: UILabel!
      @IBOutlet var d: UILabel!
      @IBOutlet var e: UILabel!
      @IBOutlet var f: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        
    }
    @objc func count() {
        if number >= 10 {
            timer?.invalidate()
        } else {
        number = number + 1
        d.text = "\(String(number))円"
        }
        
    }
       @IBAction func levelUp() {
        if number > 5 {
            number = number - 5
            level  = level + 1
            f.text = String(level)
            

            
        }
            
            
        }
    
    
    }




