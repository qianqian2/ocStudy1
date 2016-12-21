
//
//  CellModel.swift
//  FoldTableView
//
//  Created by ShaoFeng on 16/7/29.
//  Copyright © 2016年 Cocav. All rights reserved.
//

import UIKit

//import YYModel


class CellModel: NSObject {

    var cellTitle: String? = nil
    var qcontent : String?
    var faq_no : Int = 0
//    
    init(dict : [String:Any]){
        super.init()
        
        setValuesForKeys(dict)
    }
    
//
   override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
//    override var description: String{
//        return yy_modelDescription()
//    }

}
