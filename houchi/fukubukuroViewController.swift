//
//  fukubukuroViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/01/15.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import UIKit
import SCLAlertView
class fukubukuroViewController: UIViewController {
    @IBOutlet var one: UIButton!
    @IBOutlet var eleven: UIButton!
    @IBOutlet var kingaku: UILabel!
    @IBOutlet var fukubukuroButton2: UIButton!
    @IBOutlet var shopButton2: UIButton!
    @IBOutlet var kaihouButton2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shozikinn = UserDefaults.standard.object(forKey: "shozikinn") as! Int
        kingaku.text = "\(String(shozikinn))円"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ONE() {
        // 所持金を取り出す
        var shozikinn = UserDefaults.standard.integer(forKey: "shozikinn") 
        if shozikinn >  100 {
            // 所持金から金額を引く
            shozikinn = shozikinn - 100
            kingaku.text = "\(String(shozikinn))円"
            // 引いた金額を保存する
            UserDefaults.standard.set(shozikinn, forKey: "shozikinn")
            
            performSegue(withIdentifier: "1", sender: nil)
            
            } else {
            SCLAlertView().showTitle(
                "お金が足りないよ",
                subTitle: "所持金を増やして福袋を買おう！", timeout: .none,
                completeText:"戻る",
                style: .info,
                colorStyle: 0xb0c4de,
                colorTextButton: 0x696969
            )
            
            
            
            
        }
        
    }
    
    @IBAction func ELEVEN() {
        var shozikinn = UserDefaults.standard.integer(forKey: "shozikinn")
        if shozikinn >  1000 {
            shozikinn = shozikinn - 1000
            kingaku.text = "\(String(shozikinn))円"
            UserDefaults.standard.set(shozikinn, forKey: "shozikinn")
            
             performSegue(withIdentifier: "11", sender: nil)
            
        } else {
            SCLAlertView().showTitle(
                "お金が足りないよ",
                subTitle: "所持金を増やして福袋を買おう！", timeout: .none,
                completeText:"戻る",
                style: .info,
                colorStyle: 0xb0c4de,
                colorTextButton: 0x696969
            )
            
            
           
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
    @IBAction func back1() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func closeMenu(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.fukubukuroButton2.center.x = -40
            self.shopButton2.center.x = -40
            self.kaihouButton2.center.x = -40
        }, completion: {_ in
        })
    }
    
    @objc func openMenu(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.fukubukuroButton2.center.x = 50
            self.shopButton2.center.x = 50
            self.kaihouButton2.center.x = 50
        }, completion: {_ in
        })
    
    
}
}
