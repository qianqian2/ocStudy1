//
//  ViewController.swift
//  ImageViewText
//
//  Created by arang on 16/12/19.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let originBannerImage = UIImage(named: "banner.png")!

    @IBOutlet weak var iconView: UIImageView!
    

    @IBOutlet weak var btnClick: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //addImage()

        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.1)
            DispatchQueue.main.async {
                //self.addImage(self.originBannerImage)
                self.iconView.image = UIImage(named: "banner.png")
            }
        }
        
        
        let imageUrlStr = "https://hub.expertt.cn/data/banner/161205/161205113832_89337.png"
        DispatchQueue.global().async {
            if let imageUrl = Foundation.URL(string: imageUrlStr){
                if let imageDate = try? Data(contentsOf:imageUrl){
                    if let imageTest = UIImage(data: imageDate){
                        DispatchQueue.main.async {
                            self.addImage(imageTest)
                        }
                    }
                }
            }
            
        }
        
         //addImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: Any) {
        
        
       // 1. 跳转1
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let indent = "detail"
        //let vc = sb.instantiateViewController(withIdentifier: indent) as! thirdViewControll
        let vc = sb.instantiateViewController(withIdentifier: indent) as! detailViewController
    
        
        
        self.present(vc, animated: true, completion: nil)
        
         //2. 跳转2

        
    }
}







extension ViewController {
    
    
    
    
}
extension ViewController {
    func addImage(_ image: UIImage){
        let imageW = self.iconView.frame.width
        let imageH = self.iconView.frame.height
        self.iconView.frame = CGRect(x: 0, y: 0, width: imageW, height: imageH)
        self.iconView.image = image
        
    }
}
