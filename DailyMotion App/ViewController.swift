//
//  ViewController.swift
//  Dailymotion App
//
//  Created by Yiwei Zhu on 4/28/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var momentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var date:String!
    var emotion:String!
    var category:String!
    var moment:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result"
        self.emotionLabel.text = emotion
        self.categoryLabel.text = category
        self.momentLabel.text = moment
        self.dateLabel.text = date
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveClick(_ sender: Any) {
        CoreDataTool.saveMotion(time: self.date, category: self.category, moment: self.moment, emotion: self.emotion)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

