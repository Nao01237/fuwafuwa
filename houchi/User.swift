//
//  User.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/05/07.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var shozikin: Int = 0
    @objc dynamic var level: Int = 0
    @objc dynamic var maibyou: Int = 0
    @objc dynamic var cost: Int = 0
    
    
}
