//
//  NetworkTools.swift
//  WeBo
//
//  Created by Apple on 16/11/3.
//  Copyright © 2016年 叶炯. All rights reserved.
//

import UIKit
import AFNetworking

//定义枚举类型
enum RequestType : String {
    case get = "GET"
    case post = "POST"
}

class NetworkTools: AFHTTPSessionManager {

    //let 是线程安全的
    //通过闭包创建对象
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
    }()
}

//MARK:- 封装网络数据
extension NetworkTools {

    //逃逸闭包 @escaping
    //当一个传入函数的闭包在函数执行结束之后才会被调用，这样的闭包就叫做逃逸闭包。如果一个函数的参数有一个逃逸闭包，可以在参数前加@escaping关键字来修饰。
    func requestData(methodType: RequestType, urlString: String, parameters: [String: Any], finished: @escaping (_ result : Any?, _ error : Error?) -> (Void)) {
        
        // 1.定义成功的回调闭包
        let successCallBack = { (task : URLSessionDataTask,result: Any?) -> Void in
            finished(result, nil)
            
        }
        
        // 2.定义失败的回调闭包
        let failureCallBack = { (task : URLSessionDataTask?,error : Error) -> Void in
            finished(nil, error)
        }
        
        // 3.发送网络请求
        if methodType == .get {
           
            get(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            
        } else {
           
            post(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
    }
}

//MARK:- 请求首页数据
extension NetworkTools {

    func loadStatus(finished:@escaping (_ result: [[String: Any]]?, _ error: Error?) -> (Void)) {
        
        let urlString = "https://hub.expertt.cn/api/faq/plist"
        let parameters = ["faq_no":10]

        
        requestData(methodType: .get, urlString: urlString, parameters: parameters) { (result, error) -> (Void) in
            
            guard let resultDict = result as? [String: Any] else {
            
                finished(nil, error)
                return
            }
            
            finished(resultDict["slist"] as? [[String: Any]], error)
        }
    }
}
