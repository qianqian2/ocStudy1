//
//  cellDate.swift
//  FAQTree
//
//  Created by arang on 16/12/5.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class cellDate: NSObject {
    
    //属性
    var qcontent : String?
    var faq_no : Int?
    

    init(dict : [String:Any]){
        super.init()
        
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
