//
//  imageViewModel.swift
//  EventView
//
//  Created by arang on 16/12/19.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit
//import YYModel

class imageViewModel: NSObject {
    
    lazy var iconModel  = [BaseImageModel]()
    
    
}

//extension imageViewModel {
//    func loadImageDate(finishedCallback: @escaping () -> ()) {
//        let urlString = "https://hub.expertt.cn/api/banner/detail"
//        let parameters = ["bn_flag":10]
//        NetworkTools.requestData(.post, URLString: urlString, parameters: parameters) { (result) in
//
//           guard  let resultDict = result as? [String : Any] else {
//            
//              return
//            
//            }
//           // iconModel.append(resultDict) as? BaseImageModel
//            
//        }
//    }
//}
