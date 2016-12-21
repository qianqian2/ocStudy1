//
//  UIButton+Extension.swift
//  weiboText
//
//  Created by arang on 16/12/2.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

extension UIButton {
   // class func creatButton(imageName:String, bgImageName: String) -> UIButton {
//    
//        let btn = UIButton()
//        btn.setImage(UIImage(named:imageName), for: .normal)
//        btn.setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
//        btn.setBackgroundImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
//        
//        btn.setBackgroundImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
//        
//        btn.sizeToFit()
//        
//        return btn
// convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
    /*
     遍历构造函数的特点
     1.遍历构造函数通常都是写在extension里面
     2.遍历构造函数init前面需要加载convenience
     3.在遍历构造函数中需要明确的调用self.init()
     */
    convenience init ( imageName:String,bgImageName:String ){
        self.init()
        
        setImage(UIImage(named:imageName), for: .normal)
        setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named:bgImageName), for: .normal)
        setBackgroundImage(UIImage(named:bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
        
      }
    


}
