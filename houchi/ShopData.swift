//
//  ShopData.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/05/28.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import Foundation
import UIKit

struct ShopData: Codable {
    
    var id: Int
    var isUnlocked: Bool
    var unlockLevel: Int
    var name: String
    var maibyou: Int
    var cost: Int
    var level: Int
    var unlockedImage: String
    var lockedImage: String
    

}
