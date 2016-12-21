//
//  HeaderView.swift
//  FAQTEXT
//
//  Created by arang on 16/12/16.
//  Copyright © 2016年 arang. All rights reserved.
//

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

import UIKit

typealias HeaderViewClickCallBack = (Bool) -> Void

class HeaderView: UITableViewHeaderFooterView {
    
    var expandCallBack: HeaderViewClickCallBack?
    var model: SectionModel? = nil
    
    var sectionModel: SectionModel? {
        
        didSet {
            textLabel?.text = sectionModel?.sectionTitle
            if ((self.sectionModel!.isExpanded) != nil) {
                self.directionImageView.transform = CGAffineTransform.identity
            } else {
                self.directionImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let w = UIScreen.main.bounds.size.width
        
        directionImageView = UIImageView.init(image: UIImage.init(named: "expanded"))
        directionImageView.frame = CGRect(x: w - 30, y: (44 - 8) / 2, width: 15, height: 8)
        contentView.addSubview(directionImageView)
        
        let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: w, height: 44))
        contentView.addSubview(button)
        self.contentView.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(clickHeader(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    @discardableResult //不接受返回值
    func clickHeader(sender: UIButton) {
        sectionModel?.isExpanded = !((sectionModel?.isExpanded)!)
        UIView.animate(withDuration: 0.25) {
            if ((self.sectionModel?.isExpanded) != nil) {
                self.directionImageView.transform = CGAffineTransform.identity
            } else {
                self.directionImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }
        }
        if (self.expandCallBack != nil) {
            expandCallBack!((self.sectionModel?.isExpanded)!)
        }
    }
    
    private lazy var directionImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


