//
//  Game.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/06/11.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import Foundation
import RealmSwift

class Game {
    var user: User = User()
    var shops: [Shop] = []
    let realm = try! Realm()
    static let shared = Game()
    
    func start() {
        user = realm.objects(User.self).first!
        shops = Array(realm.objects(Shop.self).sorted(byKeyPath: "id", ascending: true))
    }
    
    func setup() {
        
        
        let realm = try! Realm()
        
        guard let url = Bundle.main.url(forResource: "shopData", withExtension: "json") else {
            fatalError("File not found")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ファイル読み込みエラー")
        }
        
        let decoder = JSONDecoder()
        
        guard let shopData = try? decoder.decode([ShopData].self, from: data) else {
            fatalError("JSON読み込みエラー")
        }
        
        let user = User()
                 
        user.totalMaibyou = 3
                 
                 try! realm.write() {
                     realm.add(user)
                 }
        
        try! realm.write {
            for data in shopData {
                let shop = Shop()
                shop.id = data.id
                shop.isUnlocked = data.isUnlocked
                shop.name = data.name
                shop.unlockLevel = data.unlockLevel
                shop.maibyou = data.maibyou
                shop.cost = data.cost
                shop.level = data.level
                shop.unlockedImage = data.unlockedImage
                shop.lockedImage = data.lockedImage
                realm.add(shop)
            }
        }
        
    }
}
