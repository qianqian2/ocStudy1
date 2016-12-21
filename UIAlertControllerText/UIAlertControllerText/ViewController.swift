//
//  ViewController.swift
//  UIAlertControllerText
//
//  Created by arang on 16/12/17.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let alert = UIAlertController.init(title : "alert", message : "this is a window", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title : "cancel", style : .cancel, handler : nil))
        self.present(alert,animated: true){}
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

