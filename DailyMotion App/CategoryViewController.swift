//
//  AudioViewController.swift
//  DailyMotion App
//
//  Created by Lyu, Kaiju on 5/1/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var date:String!
    var emotion:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pick the Category"
        
    }
    
    @IBAction func categoryClick(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let tag:Int = sender.tag
        var momentArr:[String] = [String]()
        
        if (tag == 1) {
            momentArr = ["family","collegue","friends","date","party"]
        } else if (tag == 2) {
            momentArr = ["shopping","cooking","cleaning","eating","sleep"]
        } else if (tag == 3) {
            momentArr = ["Movie","reading","game","sports","travel"]
        } else if (tag == 4) {
            momentArr = ["study","scholarship","planning","money","award"]
        }
        let vc:MomentViewController = storyBoard.instantiateViewController(withIdentifier: "MomentViewController") as! MomentViewController
        vc.date = self.date
        vc.emotion = self.emotion
        
        let category:[String] = ["social","daily","hobby","achievement"]
        vc.category = category[tag-1]
        vc.momentArr = momentArr
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
