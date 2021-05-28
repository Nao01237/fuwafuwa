//
//  ShopData.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/05/28.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import Foundation
import UIKit

let shops = [
    Shop(Id: 1, isUnlocked: true, name: "最初のお店", unlockedLevel: 1, maibyou: 3, cost: 25, level: 1, unlockedImeage: UIImage(named: "a")!, lockedImage: UIImage(named: "a")!
    ),
    
    Shop(Id: 2, isUnlocked: true, name: "パン屋さん", unlockedLevel: 15, maibyou: 10, cost: 100, level: 1, unlockedImeage: UIImage(named: "a")!, lockedImage: UIImage(named: "a")!
        ),
        
    Shop(Id: 3, isUnlocked: true, name: "アンティークショップ", unlockedLevel: 30, maibyou: 100, cost: 1000, level: 1, unlockedImeage: UIImage(named: "a")!, lockedImage: UIImage(named: "a")!
        ),
        
    Shop(Id: 4, isUnlocked: true, name: "謎のお店", unlockedLevel: 45, maibyou: 500, cost: 5000, level: 1, unlockedImeage: UIImage(named: "a")!, lockedImage: UIImage(named: "a")!
        ),
 ]

