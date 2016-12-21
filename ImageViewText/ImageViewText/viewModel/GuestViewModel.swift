//
//  GuestViewModel.swift
//  ImageViewText
//
//  Created by arang on 16/12/21.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class GuestViewModel {
    
    lazy var guestList : [GuestModel] = [GuestModel]()

}

extension GuestViewModel {
    
    func loadAllGuestList (finishedCallBack:@escaping()->()){
        
        let urlString = "https://hub.expertt.cn/api/notice/plist"
        let parameters = ["page":1,"per_row":10,"tot_row":0,"set_lang":"ko"] as [String : Any]

        NetworkTools.requestData(.post, URLString: urlString, parameters: parameters) { (result) in
            
            //1. 获取数据
            guard let resultDict = result as? [String:Any] else {return}
            guard let dataArray = resultDict["plist"] as? [[String:Any]] else {return }
            print(dataArray)
            
            // 2. 字典转模型
            
            for dict in dataArray {
                
                self.guestList.append(GuestModel(dict: dict))
            }
            
            
            //3.  完成回调
            finishedCallBack()
    }
    
    }
}
