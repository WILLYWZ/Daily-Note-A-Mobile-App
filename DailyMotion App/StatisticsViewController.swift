//
//  AudioViewController.swift
//  DailyMotion App
//
//  Created by Lyu, Kaiju on 5/1/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataSource:[String] = ["Awkward","Happy","Angry","Cool","Disgusted","Upset","Dead","Nice","Scared"]
    var countSource:[String] = [String]()
    var mixSource:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Report"
        self.tableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: "StatisticsTableViewCell")
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sum = CoreDataTool.fearchAllMotion().count
        self.countSource.removeAll()
        self.mixSource.removeAll()
        if (sum > 0) {
            for (_,value) in dataSource.enumerated() {
                let tmpMotion:[Motion] = CoreDataTool.fearchMotions(emotion: value)
                let countStr:String = String(tmpMotion.count)
                self.countSource.append(countStr)
                let result:Float = Float(tmpMotion.count) * 1.0 / Float(sum) * 100
                var mixStr = ""
                if (Float(Int(result)) == result) {
                    mixStr = String(format: "%.0f", result) + "%"
                } else {
                    mixStr = String(format: "%.2f", result) + "%"
                }
                self.mixSource.append(mixStr)
                self.tableView.reloadData()
            }
        } else {
            self.countSource = ["0","0","0","0","0","0","0","0","0"]
            self.mixSource = ["0%","0%","0%","0%","0%","0%","0%","0%","0%"]
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:StatisticsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StatisticsTableViewCell", for: indexPath) as! StatisticsTableViewCell
        cell.config(title: self.dataSource[indexPath.row], count: self.countSource[indexPath.row], mix: self.mixSource[indexPath.row])
        return cell
    }
}
