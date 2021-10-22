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
	var shozikinn = 0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		shozikinn = Game.shared.user.shozikin
		kingaku.text = "\(String(shozikinn))円"
	}
	
	@IBAction func ONE() {
		// 所持金を取り出す
		if shozikinn >  1500 {
			performSegue(withIdentifier: "1", sender: nil)
			// 所持金から金額を引く
			shozikinn = shozikinn - 1500
			kingaku.text = "\(String(shozikinn))円"
			
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
		if shozikinn >  15000 {
    		performSegue(withIdentifier: "11", sender: nil)
			shozikinn = shozikinn - 15000
			kingaku.text = "\(String(shozikinn))円"
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
