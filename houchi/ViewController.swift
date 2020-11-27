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
    @IBOutlet var a: UILabel!
      @IBOutlet var b: UILabel!
      @IBOutlet var c: UILabel!
      @IBOutlet var d: UILabel!
      @IBOutlet var e: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       let timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        
    }
    @objc func count() {
        number = number + 1
        d.text = String(number)
    }


}

