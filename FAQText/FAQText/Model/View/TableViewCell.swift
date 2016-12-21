//
//  TableViewCell.swift
//  FAQTEXT
//
//  Created by arang on 16/12/16.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var cellModel: CellModel? {
        didSet {
            textLabel?.text = cellModel?.cellTitle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
