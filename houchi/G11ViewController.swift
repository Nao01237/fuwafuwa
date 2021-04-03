//
//  G11ViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2020/12/28.
//  Copyright © 2020 橋目　那桜. All rights reserved.
//

import UIKit

class G11ViewController: UIViewController {
    var number11: Int!
    var number12: Int!
    var number13: Int!
    var number14: Int!
    var number15: Int!
    var number16: Int!
    var number17: Int!
    var number18: Int!
    var number19: Int!
    var number20: Int!
    var number21: Int!
    
    
    @IBOutlet var g11: UIImageView!
    @IBOutlet var g12: UIImageView!
    @IBOutlet var g13: UIImageView!
    @IBOutlet var g14: UIImageView!
    @IBOutlet var g15: UIImageView!
    @IBOutlet var g16: UIImageView!
    @IBOutlet var g17: UIImageView!
    @IBOutlet var g18: UIImageView!
    @IBOutlet var g19: UIImageView!
    @IBOutlet var g20: UIImageView!
    @IBOutlet var g21: UIImageView!
    
    @IBOutlet var L11: UILabel!
    @IBOutlet var L12: UILabel!
    @IBOutlet var L13: UILabel!
    @IBOutlet var L14: UILabel!
    @IBOutlet var L15: UILabel!
    @IBOutlet var L16: UILabel!
    @IBOutlet var L17: UILabel!
    @IBOutlet var L18: UILabel!
    @IBOutlet var L19: UILabel!
    @IBOutlet var L20: UILabel!
    @IBOutlet var L21: UILabel!
    

    var imeagname:[String] = ["kutu1","kazari1","kazari2","kazari3"]
    
    var aitemuname:[String] = ["妖精の靴","新緑のツタの冠","魔法の絆創膏","真っ赤なリボン"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        number11 = Int.random(in: 0...3)
        number12 = Int.random(in: 0...3)
        number13 = Int.random(in: 0...3)
        number14 = Int.random(in: 0...3)
        number15 = Int.random(in: 0...3)
        number16 = Int.random(in: 0...3)
        number17 = Int.random(in: 0...3)
        number18 = Int.random(in: 0...3)
        number19 = Int.random(in: 0...3)
        number20 = Int.random(in: 0...3)
        number21 = Int.random(in: 0...3)
        
        g11.image = UIImage(named: imeagname[number11])//イメージネームって言うって言う配列の中身をランダムに取り出す
        g12.image = UIImage(named: imeagname[number12])
        g13.image = UIImage(named: imeagname[number13])
        g14.image = UIImage(named: imeagname[number14])
        g15.image = UIImage(named: imeagname[number15])
        g16.image = UIImage(named: imeagname[number16])
        g17.image = UIImage(named: imeagname[number17])
        g18.image = UIImage(named: imeagname[number18])
        g19.image = UIImage(named: imeagname[number19])
        g20.image = UIImage(named: imeagname[number20])
        g21.image = UIImage(named: imeagname[number21])
        
        L11.text = aitemuname[number11]
        L12.text = aitemuname[number12]
        L13.text = aitemuname[number13]
        L14.text = aitemuname[number14]
        L15.text = aitemuname[number15]
        L16.text = aitemuname[number16]
        L17.text = aitemuname[number17]
        L18.text = aitemuname[number18]
        L19.text = aitemuname[number19]
        L20.text = aitemuname[number20]
        L21.text = aitemuname[number21]
        
        
        
     
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    @IBAction func back() {
               self.dismiss(animated: true, completion: nil)
}
}
