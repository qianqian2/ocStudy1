//
//  DetailViewController.swift
//  BtnText
//
//  Created by arang on 16/12/20.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var label = UILabel()
    var itemString :String?
    
    @IBOutlet weak var textFile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        textFile.text = itemString
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }

 
}
