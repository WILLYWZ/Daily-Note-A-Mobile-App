//
//  AudioViewController.swift
//  DailyMotion App
//
//  Created by Lyu, Kaiju on 5/1/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class MomentViewController: UIViewController {
    @IBOutlet weak var momentOne: UIButton!
    @IBOutlet weak var momentTwo: UIButton!
    @IBOutlet weak var momentThree: UIButton!
    @IBOutlet weak var momentFour: UIButton!
    @IBOutlet weak var momentFive: UIButton!

    var date:String!
    var emotion:String!
    var category:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pick the Moment"
        self.momentOne.setImage(UIImage.init(named: momentArr[0]), for: .normal)
        self.momentTwo.setImage(UIImage.init(named: momentArr[1]), for: .normal)
        self.momentThree.setImage(UIImage.init(named: momentArr[2]), for: .normal)
        self.momentFour.setImage(UIImage.init(named: momentArr[3]), for: .normal)
        self.momentFive.setImage(UIImage.init(named: momentArr[4]), for: .normal)
        
//        self.momentOne.setTitle(momentArr[0], for: .normal)
//        self.momentTwo.setTitle(momentArr[1], for: .normal)
//        self.momentThree.setTitle(momentArr[2], for: .normal)
//        self.momentFour.setTitle(momentArr[3], for: .normal)
//        self.momentFive.setTitle(momentArr[4], for: .normal)
    }
    
    var momentArr:[String]!
    @IBAction func momentClick(_ sender: UIButton) {
        let tag:Int = sender.tag
        let moment:String = self.momentArr[tag-1]
        print(moment)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc:ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.category = self.category
        vc.date = self.date
        vc.emotion = self.emotion
        vc.moment = moment
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
