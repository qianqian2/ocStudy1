//
//  BaseImageModel.swift
//  EventView
//
//  Created by arang on 16/12/19.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit
//import YYModel

class BaseImageModel: NSObject {
    
    var img_nm: String = ""
    var bn_url:String = ""


    override init(){
        
    }
    

    init(dict:[String:Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    
    
//    override var description: String {
//        return yy_modelDescription()
//    }
    
    
    
    
}
