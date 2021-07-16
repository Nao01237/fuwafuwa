//
//  kaihouViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/04/03.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import UIKit
import RealmSwift
import SCLAlertView

class kaihouViewController: UIViewController {
    let game = Game.shared
    
    @IBOutlet var shop1: UIImageView!
    @IBOutlet var shop2: UIImageView!
    @IBOutlet var shop3: UIImageView!
    
    @IBOutlet var k1: UIButton!
    @IBOutlet var k2: UIButton!
    @IBOutlet var k3: UIButton!
    
    var shopNumber: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shopNumber: Int!
        
    

        if game.shops[2].level >= 45 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "c")
            shop3.image = UIImage(named: "d")
            k1.setTitle("解放済み", for: .normal)
            k2.setTitle("解放済み", for: .normal)
            k3.setTitle("解放済み", for: .normal)
            
            
        } else if game.shops[1].level >= 30 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "c")
            shop3.image = UIImage(named: "dd")
            k1.setTitle("解放済み", for: .normal)
            k2.setTitle("解放済み", for: .normal)
            
        } else if game.shops[0].level >= 15 {
            shop1.image = UIImage(named: "b")
            shop2.image = UIImage(named: "cc")
            shop3.image = UIImage(named: "dd")
            k1.setTitle("解放済み", for: .normal)
            
            
        } else {
            shop1.image = UIImage(named: "bb")
            shop2.image = UIImage(named: "cc")
            shop3.image = UIImage(named: "dd")
            
 
        }
    }
    
         @IBAction func selectShop01() {
           
                 
            if game.shops[0].level >= 15 {
                
                
                SCLAlertView().showTitle(
                              "パン屋さんが解放されたよ！",
                              subTitle: "新しいお店も繁盛させよう！", timeout: .none,
                              completeText:"戻る",
                              style: .info,
                              colorStyle: 0xb0c4de,
                              colorTextButton: 0x696969
                          )
            }else{
                SCLAlertView().showTitle(
                "レベルが足りないよ",
                subTitle: "もっとレベルをあげよう！", timeout: .none,
                completeText:"戻る",
                style: .info,
                colorStyle: 0xb0c4de,
                colorTextButton: 0x696969
               )
        }
            
            

        }
    
      
         @IBAction func selectShop2() {
            
            if game.shops[1].level >= 30 {
                  UserDefaults.standard.removeObject(forKey: "shopNumber")
                  
                  shopNumber = 3
                  UserDefaults.standard.set(shopNumber, forKey: "shopNumber")
                  
                  SCLAlertView().showTitle(
                                "アンティークショップが解放されたよ！",
                                subTitle: "新しいお店も繁盛させよう！", timeout: .none,
                                completeText:"戻る",
                                style: .info,
                                colorStyle: 0xb0c4de,
                                colorTextButton: 0x696969
                            )
                
              }else{
                  SCLAlertView().showTitle(
                  "レベルが足りないよ",
                  subTitle: "もっとレベルをあげよう！", timeout: .none,
                  completeText:"戻る",
                  style: .info,
                  colorStyle: 0xb0c4de,
                  colorTextButton: 0x696969
                 )
          }
              
        
              
    }
    
      
           @IBAction func selectShop03() {
             
            if game.shops[2].level >= 45 {
                  UserDefaults.standard.removeObject(forKey: "shopNumber")
                  
                  shopNumber = 3
                  UserDefaults.standard.set(shopNumber, forKey: "shopNumber")
                  
                  SCLAlertView().showTitle(
                                "謎のお店が解放されたよ！",
                                subTitle: "新しいお店も繁盛させよう！", timeout: .none,
                                completeText:"戻る",
                                style: .info,
                                colorStyle: 0xb0c4de,
                                colorTextButton: 0x696969
                            )
              }else{
                  SCLAlertView().showTitle(
                  "レベルが足りないよ",
                  subTitle: "もっとレベルをあげよう！", timeout: .none,
                  completeText:"戻る",
                  style: .info,
                  colorStyle: 0xb0c4de,
                  colorTextButton: 0x696969
                 )
          }
              
              

          }
        
    

   @IBAction func back() {
   self.dismiss(animated: true, completion: nil)
}

}

