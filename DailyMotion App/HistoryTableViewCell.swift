//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    var dateLabel:UILabel!
    var momentLabel:UILabel!
    var motion:Motion!{
        didSet{
            self.dateLabel.text = motion.time
            self.momentLabel.text = "\(String(motion.emotion!)) \(String(motion.category!)) \(String(motion.moment!))"
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.dateLabel = UILabel.init()
        self.contentView.addSubview(self.dateLabel)
        
        self.momentLabel = UILabel.init()
        self.contentView.addSubview(self.momentLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.dateLabel.frame = CGRect.init(x: 15, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height * 0.5)
        self.momentLabel.frame = CGRect.init(x: 15, y: self.contentView.frame.height * 0.5, width: self.contentView.frame.width, height: self.contentView.frame.height * 0.5)
    }

}
