//
//  ViewController.swift
//  AFNetworkingWraping
//
//  Created by arang on 16/12/4.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    
    //let bn_flag : String = ""
    override  func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlstring = "https://hub.expertt.cn/api/banner/detail"
        let parameter = ["bn_flag":10]
        
        NetworkTools.shareInstance.request(requestType: .Post, url: urlstring, parameters: parameter) { (response, error) in
            
//            guard let dicArray = response as? [[String:Any]] else {
//                return
//            }
            print(response)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

