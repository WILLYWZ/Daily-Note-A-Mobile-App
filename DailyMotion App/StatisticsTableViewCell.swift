//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {

    var momentButton:UIButton!
    var countLabel:UILabel!
    var mixLabel:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.momentButton = UIButton.init(type: .system)
        self.contentView.addSubview(self.momentButton)
        
        self.countLabel = UILabel.init()
        self.countLabel.textAlignment = .center
        self.contentView.addSubview(self.countLabel)
        
        self.mixLabel = UILabel.init()
        self.mixLabel.textAlignment = .center
        self.contentView.addSubview(self.mixLabel)
    }
    
    
    
    func config(title:String,count:String,mix:String) -> Void {
        self.momentButton.setTitle(title, for: .normal)
        self.countLabel.text = count
        self.mixLabel.text = mix
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.momentButton.frame = CGRect.init(x: 0, y: 0, width: self.contentView.frame.width * 0.33, height: self.contentView.frame.height)
        self.countLabel.frame = CGRect.init(x: self.contentView.frame.width * 0.33, y: 0, width: self.contentView.frame.width * 0.33, height: self.contentView.frame.height)
        self.mixLabel.frame = CGRect.init(x: self.contentView.frame.width * 0.67, y: 0, width: self.contentView.frame.width * 0.33, height: self.contentView.frame.height)
    }


}
