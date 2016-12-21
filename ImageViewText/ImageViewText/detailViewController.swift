//
//  detailViewController.swift
//  ImageViewText
//
//  Created by arang on 16/12/19.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    fileprivate lazy var guestVM :GuestViewModel = GuestViewModel()
    

    @IBOutlet weak var back: UIBarButtonItem!
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var btnActionCallback: (()->())!

    
    //let textArray = ["text1","text2","text3","text4"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        loadData()

        
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



//MARK: - loadGuestDate

extension detailViewController{
    
 
    fileprivate func loadData(){
        
        guestVM.loadAllGuestList {
            
            //1.展示数据
            self.tableView.reloadData()
            // 2. 数据请求完成
            
        }
        
    }
    
    
}



extension detailViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return guestVM.guestList.count
        
    }
    
    
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        let identify:String = "cell1"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = guestVM.guestList[indexPath.row].subject
        
        print(guestVM.guestList[indexPath.item])
      
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        let itemString = self.guestVM.guestList[indexPath.row].subject
        self.performSegue(withIdentifier: "ShowDetailView", sender: itemString)

    }
    
    //在此方法中给新页面传递参数
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetailView"{
            
            let controller = segue.destination as! thirdViewControll
            controller.itemString = sender as? String
            
        
    }
    
        
    

}
}
