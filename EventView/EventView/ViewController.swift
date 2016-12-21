//
//  ViewController.swift
//  EventView
//
//  Created by arang on 16/12/19.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    

    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var goBtn: UIButton!
    
    let array = [String]()
    
   // let array = [String]()
    
     // fileprivate lazy var iconDate : imageViewModel = imageViewModel()
    lazy var iconDate = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDate()
        setBtn()
    }
    
    func setBtn(){
   
        
        for i in 1...2 {
            
            goBtn.tag = i
            print(goBtn.tag)
           // goBtn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        }
        
    }
   
    
    @IBAction func btnClick(_ sender: Any) {
        
        
        let tags = goBtn.tag
        print(tags)
        switch tags {
        case 1:
            let detailVC = detailViewController()
            detailVC.title = "denglu"
            self.navigationController?.pushViewController(detailVC, animated: true)
            break
            
        case 2:
            
            let secondVC = SecondViewController()
            secondVC.title = "second"
            self.navigationController?.pushViewController(secondVC, animated: true)
            break
            
        default:
            break
        }
    }
    
    
}


extension ViewController {
    func loadDate(){
        //let url = "https://hub.expertt.cn/161205/161205113832_89337.png
       // let url = "https://hub.expertt.cn/data/banner/161205/161205113832_89337.png"


            let urlString = "https://hub.expertt.cn/api/banner/detail"
            let parameters = ["bn_flag":10]
            NetworkTools.requestData(.post, URLString: urlString, parameters: parameters) { (result) in
                guard  let resultDate = result as?[String : Any] else {
                    return
                }
               print(resultDate)
                self.iconDate["img_nm"] = resultDate["img_nm"]
                print(self.iconDate["img_nm"] ?? [])
                
                self.icon.image = UIImage(named:self.iconDate["img_nm"] as! String)
                }
                //print(iconDate["img_nm"] ?? [])
            }
    

}



extension ViewController{
    
    
    
    
}
