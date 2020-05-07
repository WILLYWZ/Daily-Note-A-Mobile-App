//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    var date:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chooseDate(self.datePicker)
    }
    
    
    @IBAction func feelingClick(_ sender: UIButton) {
        let tag:Int = sender.tag
        let emotionArr:[String] = ["Awkward","Happy","Angry","Cool","Disgusted","Upset","Dead","Nice","Scared"]
        let emotion = emotionArr[tag - 1]
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc:CategoryViewController = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        vc.date = self.date
        vc.emotion = emotion
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dateChange(_ sender: UIDatePicker) {
        self.chooseDate(self.datePicker)
    }
    
    func chooseDate(_ sender: UIDatePicker) {
        let date:Date = sender.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.date = formatter.string(from: date)
    }
}
