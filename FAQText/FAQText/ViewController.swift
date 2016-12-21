//
//  ViewController.swift
//  FoldTableView
//
//  Created by ShaoFeng on 16/7/29.
//  Copyright © 2016年 Cocav. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    
     fileprivate lazy var dataArr: [CellViewModel] = [CellViewModel]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        makeDate()
//        SectionModel.loadData { (models) in
//            self.dataSource = models
//        }
        view.addSubview(tableView)
        tableView.frame = UIScreen.main.bounds
    }
    
    /// 懒加载
    //fileprivate lazy var dataSource: [SectionModel]? = nil
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}


//MARK: - 加载数据

extension ViewController {
    
        fileprivate func makeDate() {
            
            
            SVProgressHUD.show(withStatus: "正在加载...")
            NetworkTools.shareInstance.loadStatus { (result, error) -> (Void) in
                
            
                SVProgressHUD.dismiss()
                // 1.错误信息校验
                if error != nil {
                   // DLog(error)
                    return
                }
                // 2.获取可选类型中的数据
                guard let resultArray = result else {
                    return
                }
                

                // 3.遍历微博对应的字典
                var tempViewModel = [CellViewModel]()
                for statusDict in resultArray {
                    let model = CellModel(dict: statusDict)
                    let viewModel = CellViewModel(cellModel: model)
                    tempViewModel.append(viewModel)
                }
                
                // 4. 刷新表格
                //tableView.reloadData()
                
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataSource![section].isExpanded != false) ? dataSource![section].cellModels.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id") as? TableViewCell
        if cell == nil {
            cell = TableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: "id")
        }
        
        cell?.cellModel = dataSource![indexPath.section].cellModels[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "id") as? HeaderView
        if headerView == nil {
            headerView = HeaderView.init(reuseIdentifier: "id")
        }
        headerView?.sectionModel = dataSource![section]
        headerView!.expandCallBack = {
            (isExpanded: Bool) -> Void in
            tableView.reloadSections(NSIndexSet.init(index: section) as IndexSet, with: UITableViewRowAnimation.fade)
        }
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

