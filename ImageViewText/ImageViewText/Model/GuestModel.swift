//
//  GuestModel.swift
//  ImageViewText
//
//  Created by arang on 16/12/21.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit


class GuestModel: NSObject {
    
    var nt_no:Int = 0
    var subject : String = ""
    var content :String = ""
    //var reg_dates :
    
    
    //自定义构造函数
    
    override init (){  }
    
    init (dict: [String :Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }

}
