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
    let game = Game.shared
    var timer: Timer?
    var index: Int = 0
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

        shopImage.image = UIImage(named: game.shops[index].unlockedImage)
        
        b.text =  game.shops[index].name
        
        f.text = String(game.shops[index].level)
        
        g.text = String(game.shops[index].cost)
        
        a.text =  String(game.shops[index].maibyou)


        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.count),
            userInfo: nil,
            repeats: true     )
        
      
        f.text = String(game.shops[index].level)
        a.text = "毎秒　\(String(game.shops[index].maibyou))"
        g.text = "\(String(game.shops[index].cost))円"
        
        
       
       
        
        
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
       
        
        
        if game.user.shozikin >= 10000000 {
            timer?.invalidate()
        } else {
            try!realm.write() {
                 game.user.shozikin = game.user.shozikin + game.user.totalMaibyou
            }
           
            d.text = "\(String(game.user.shozikin))円"
        }
    }
    
    @IBAction func levelUp() {
        
        if game.user.shozikin >= game.shops[index].cost {
            let level = game.shops[index].level + 1
            let maibyou = game.shops[index].maibyou
            let cost = maibyou * 25
            
            try! realm.write() {
                game.user.shozikin -= game.shops[index].cost
                game.shops[index].level = level
                game.user.totalMaibyou = maibyou
                game.shops[index].cost = cost
                game.shops[index].maibyou += maibyou
            }
            
            
            f.text = String(game.shops[index].level)
            g.text = "\(String(game.shops[index].cost))円"
            a.text = "毎秒 　\(String(game.shops[index].maibyou))"
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
    
    @IBAction func next() {
        index += 1
        if index > game.shops.count - 1 {
            index = 0
        }
        
        b.text = game.shops[index].name
        f.text = String(game.shops[index].level)
        a.text = "毎秒　\(String(game.shops[index].maibyou))"
        g.text = "\(String(game.shops[index].cost))円"
        
        if game.shops[index].isUnlocked {
            shopImage.image = UIImage(named: game.shops[index].unlockedImage)
        } else {
            shopImage.image = UIImage(named: game.shops[index].lockedImage)
        }
   
}
    @IBAction func prev() {
        index -= 1
        if index < 0 {
            index = 0
        }
        
        b.text = game.shops[index].name
        f.text = String(game.shops[index].level)
        a.text = "毎秒　\(String(game.shops[index].maibyou))"
        g.text = "\(String(game.shops[index].cost))円"
        
        if game.shops[index].isUnlocked {
            shopImage.image = UIImage(named: game.shops[index].unlockedImage)
        } else {
            shopImage.image = UIImage(named: game.shops[index].lockedImage)
        }

}
}
