//
//  ViewController.swift
//  BtnText
//
//  Created by arang on 16/12/20.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit
import Kingfisher


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    
    var ctrlnames: [String] = ["text1", "text2", "text3"];
    
    var tableView : UITableView?
    
    
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var iconView: UIImageView!
    
    
    //@IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        self.view.addSubview(self.tableView!)
        
    }
    
    
    func loadIcon (){
        
        let urlString = ""
        
        ///unresolved identifier 'Img_defult'
        self.imageView.kf.setImage(with: urlString, placeholder: UIImage(named: "#imageLiteral(resourceName: ",Img_defult,")"), options: _ , progressBlock: _ , completionHandler: _ )
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
        
    }
    
    
    // 创建各单元格（创建参数indexPath指定的单元）
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let identify : String = "cell1"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.ctrlnames[indexPath.row]
        return cell
        
    }
    
    //UITableViewDelegaate方法，处理列表选项中的 事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        let itemString = self.ctrlnames[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowDetailView", sender: itemString)
        
    }
    
    
    // 在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailView"{
        let controller = segue.destination as! DetailViewController
            controller.itemString = sender as?String
            
        }
        
    }
    
    
    //@IBAction func btnClick(_ sender: Any) {
      //1. 方法1 －－ 黑屏
//       let detailVC = DetailViewController()
//        detailVC.title = "detail"
//        //navigationController?.pushViewController(detailVC, animated: true)
//        self.present(detailVC, animated: true, completion: nil)
        
        // 2. 方法2
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vr = sb.instantiateViewController(withIdentifier: "detail") as! DetailViewController
//        vr.title = "detail"
//        
//        self.present(vr, animated: true, completion: nil)
        
        
        
    }
    




