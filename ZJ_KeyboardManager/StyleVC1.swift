//
//  StyleVC1.swift
//  ZJ_KeyboardManager
//
//  Created by jglx on 16/11/17.
//  Copyright © 2016年 zj. All rights reserved.
//

import UIKit

class StyleVC1: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let kCellName = "WHCell"
    
    private lazy var keyborad = WHC_KeyboradManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Tableview"
        self.view.backgroundColor = UIColor.white
        
        keyborad.whc_SetHeader(view: WHC_KeyboradHeaderView())
        
        keyborad.whc_SetOffsetView { [unowned self](field) -> UIView? in
            return self.tableView
        }
        
        keyborad.whc_SetOffset { (field) -> CGFloat in
            return 40
        }
//        tableView.delegate = self
//        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var  cell = tableView.dequeueReusableCell(withIdentifier: kCellName)
//        if cell == nil {
//            cell = UITableViewCell(style: .default,reuseIdentifier:kCellName)
//            let field = UITextField()
//            cell?.contentView.addSubview(field)
//            field.tag = 100
//            field.whc_Left(16)
//            field.whc_Top(0)
//            field.whc_Right(0)
//            field.whc_Bottom(0)
//            
//            keyboard.whc_AutoMonitor(view: cell!)
//        }
//        (cell?.contentView.viewWithTag(100) as? UITextField)?.placeholder = "请输入内容\(indexPath.row)"
//        return cell!
//        
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellName)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: kCellName)
            let field = UITextField()
            cell?.contentView.addSubview(field)
            field.tag = 100
            field.whc_Left(16)
                .whc_Top(0)
                .whc_Right(0)
                .whc_Bottom(0)
            /// 添加监视视图
            keyborad.whc_AutoMonitor(view: cell!)
        }
    
        (cell?.contentView.viewWithTag(100) as? UITextField)?.placeholder = "请输入内容\(indexPath.row)"
        return cell!
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
