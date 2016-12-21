//
//  TableViewController.swift
//  AFNetworkingWraping
//
//  Created by arang on 16/12/6.
//  Copyright © 2016年 arang. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    
    
    
    
    fileprivate lazy var cellDates : [cellDate] = [cellDate]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDate()
        setupNavItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    
    
    
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//         return cellDates.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        
        return cellDates.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        
        let bigCell = tableView.dequeueReusableCell(withIdentifier: "bigcell")!
        
        let celldate = cellDates[indexPath.row]
        
        bigCell.textLabel?.text = celldate.qcontent
        
       // print("celldate.qcontent")
        
        return bigCell


    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension TableViewController {
    
    func loadDate () {
        // Do any additional setup after loading the view, typically from a nib.
        let urlstring = "https://hub.expertt.cn/api/faq/plist"
        let parameter = ["faq_no":10]
        
        NetworkTools.shareInstance.request(requestType: .Post, url: urlstring, parameters: parameter, succeed: { (response) in
            
            print(response)
            guard let dicArray = response?["plist"] as? [[String: Any]] else {
                return
            }
            
            //print(dicArray)
            for cellDict in dicArray {
                
                let cell = cellDate(dict: cellDict)
                self.cellDates.append(cell)
                
            }
            // 4. 刷新表格
            self.tableView.reloadData()
            
        }) { (error) in
            
            guard let error = error else {
                return
            }
            print(error)
        }
        
    }
    
    
    
}


//MARK: - 设置导航栏左右的UI信息

extension TableViewController {
    
    fileprivate func setupNavItems() {
        
        
       self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "FAQ", style: .plain, target: self, action: #selector(TableViewController.backBtnClick))
//        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //修改导航栏颜色
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        
//        let button =   UIButton(type: .system)
//        button.frame = CGRect(x:0, y:0, width:65, height:30)
//        //button.setBackgroundImage(UIImage(named:"back"), for: .normal)
//        button.setImage(UIImage(named:"back"), for: .normal)
//        button.setTitle("FAQ", for: .normal)
//        button.sizeToFit()
//
//        button.addTarget(self, action: #selector(TableViewController.backBtnClick), for: .touchUpInside)
//        button.sizeToFit()
//        
//        let leftBarBtn = UIBarButtonItem(customView: button)
//        
//        //用于消除左边空隙，要不然按钮顶不到最前面
//        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
//                                     action: nil)
//        spacer.width = -10;
//        
//        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
    }
        
        
    }
    
    


//MARK: - 事件监听的方法

extension TableViewController {
    
    func backBtnClick (){
        print("back")
    }
    
    
}
