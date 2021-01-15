//
//  fukubukuroViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/01/15.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import UIKit

class fukubukuroViewController: UIViewController {
 @IBOutlet var one: UIButton!
    @IBOutlet var eleven: UIButton!
    @IBOutlet var kingaku: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
var shozikinn = UserDefaults.standard.object(forKey: "shozikinn") as! Int
         kingaku.text = "\(String(shozikinn))円"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ONE() {
        
    // 所持金を取り出す
    
    // 所持金から金額を引く
        
    // 引いた金額を保存する
        
        
    }
    
    @IBAction func ELEVEN() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
