//
//  MainViewController.swift
//  weiboText
//
//  Created by arang on 16/12/2.
//  Copyright © 2016年 arang. All rights reserved.
//
import UIKit

class MainViewController: UITabBarController {
    
    
    fileprivate lazy var composeBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComposeBtn()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - 设置UI
extension MainViewController {
    
    //设置发布按钮
    fileprivate func setComposeBtn() {
        
        //1.将composeBtn添加到tabbar中
        tabBar.addSubview(composeBtn)
        //2.设置btn尺寸
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height * 0.5)
        //3.监听事件点击
        composeBtn.addTarget(self, action: #selector(MainViewController.composeBtnClick), for: .touchUpInside)

 
    }
}

//MARK: - 监听事件点击
extension MainViewController{
    
    @objc fileprivate func composeBtnClick(){
        print("did click")
        
    }
}

