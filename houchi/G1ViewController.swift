//
//  G1ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/12/27.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit

class G1ViewController: UIViewController {
    var number: Int!
       
       @IBOutlet var g1: UIImageView!
    
     @IBOutlet var L1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        number = Int.random(in: 0...9)
        
            if number == 9 {
                g1.image = UIImage(named: "kutu1")
                L1.text = "妖精の靴"
               
            } else if number == 8 {
                g1.image = UIImage(named: "kazari1")
               L1.text = "新緑のツタの冠"
            } else {
                g1.image = UIImage(named: "kazari2")
               L1.text = "魔法の絆創膏"
                
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
}

