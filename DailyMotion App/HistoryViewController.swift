//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource:[Motion] = [Motion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History"
        self.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        self.tableView.tableFooterView = UIView()
        
        self.dataSource = CoreDataTool.fearchAllMotion()
        self.tableView.reloadData()
        
        
        let deleteButton:UIButton = UIButton.init(type: .system)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteAll), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: deleteButton)
    }
    
    @objc func deleteAll() -> Void {
        CoreDataTool.deleteAllMotion()
        self.dataSource = CoreDataTool.fearchAllMotion()
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataSource = CoreDataTool.fearchAllMotion()
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HistoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.motion = self.dataSource[indexPath.row]
        return cell
    }
    
}
