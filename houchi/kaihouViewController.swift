//
//  kaihouViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/04/03.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import UIKit

import SCLAlertView

class kaihouViewController: UIViewController {
    
    @IBOutlet var shop1: UIImageView!
    @IBOutlet var shop2: UIImageView!
    @IBOutlet var shop3: UIImageView!
    
    @IBOutlet var k1: UIButton!
    @IBOutlet var k2: UIButton!
    @IBOutlet var k3: UIButton!
    
    var level = UserDefaults.standard.object(forKey: "level") as! Int

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shopnumber: Int!
        
       

        if level > 45 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "c")
            shop3.image = UIImage(named: "d")
            k1.setTitle("解放済み", for: .normal)
            k2.setTitle("解放済み", for: .normal)
            k3.setTitle("解放済み", for: .normal)
            
            
        } else if level > 30 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "c")
            shop3.image = UIImage(named: "dd")
            k1.setTitle("解放済み", for: .normal)
            k2.setTitle("解放済み", for: .normal)
            
        } else if level > 15 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "cc")
            shop3.image = UIImage(named: "dd")
            k1.setTitle("解放済み", for: .normal)
            
            
        } else {
            shop1.image = UIImage(named: "bb")
            shop2.image = UIImage(named: "cc")
            shop3.image = UIImage(named: "dd")
            
            
            
            
            
            
       
        }
         @IBAction func selectShop01() {
            
            if level > 15
            
        }

        
        
    }
    

   @IBAction func back() {
   self.dismiss(animated: true, completion: nil)
}
}
