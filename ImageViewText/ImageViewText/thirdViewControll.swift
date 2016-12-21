//
//  thirdViewControll.swift
//  ImageViewText
//
//  Created by arang on 16/12/21.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class thirdViewControll: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var itemString : String?
    var confirmCallBack: (()->())!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = itemString

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backBtn(_ sender: Any) {
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
        guard self.confirmCallBack != nil else{
           return
        }
        self.confirmCallBack()
        
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
