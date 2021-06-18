//
//  shop.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/05/28.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Shop: Object {
    
    @objc dynamic var id: Int = 1
    
    @objc dynamic var isUnlocked: Bool = false
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var unlockLevel: Int = 0
    
    @objc dynamic var maibyou: Int = 0
    
    @objc dynamic var cost: Int = 0
    
    @objc dynamic var level: Int = 0
    
    @objc dynamic var unlockedImage: String = ""
    
    @objc dynamic var lockedImage: String = ""
    
   
    
    
}
