//
//  StyleVC2.swift
//  ZJ_KeyboardManager
//
//  Created by jglx on 16/11/17.
//  Copyright © 2016年 zj. All rights reserved.
//

import UIKit

class StyleVC2: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    private lazy var keyboard = WHC_KeyboradManager();
    private lazy var stackView: WHC_StackView = WHC_StackView()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ScrollView"
        self.view.backgroundColor = UIColor.white;
        
        stackView.whc_Orientation = .vertical
        stackView.whc_SegmentLineSize = 0.5
        stackView.whc_SubViewHeight = 40
        stackView.whc_Edge = UIEdgeInsetsMake(0, 16, 0, 16)
        
        scrollView.addSubview(stackView)
        stackView.whc_Left(0)
        .whc_Top(0)
        .whc_Right(0,toView:self.view)
        .whc_HeightAuto()
        .whc_Bottom(0, keepHeightConstraint:true)
        
        for i in 0 ..< 30 {
            if i < 15{
             let text = UITextView()
                text.text = "UITextView = \(i)"
                text.font = UIFont.systemFont(ofSize: 14)
                stackView.addSubview(text)
            }else{
              let text = UITextField()
                text.placeholder = "UITextField\(i)"
                stackView.addSubview(text)
            }
        }
        stackView.whc_StartLayout()
        let header = WHC_KeyboradHeaderView()
        header.nextButton.setTitleColor(UIColor.white, for: .normal)
        header.frontButton.setTitleColor(UIColor.white, for: .normal)
        header.doneButton.setTitleColor(UIColor.white, for: .normal)
        header.backgroundColor = UIColor.orange
        
        header.clickDoneButtonBlock = {
          print("点击完成")
        }
        header.clickFrontButtonBlock = {
            print("点击前一个");
        }
        header.clickNextButtonBlock = {
          print("点击下一个")
        }
        
        keyboard.whc_AutoMonitor(view: scrollView)
        keyboard.whc_SetHeader(view: header)
        keyboard.whc_SetOffsetView { [unowned self](field) -> UIView? in
            return self.scrollView
        }
        keyboard.whc_SetOffset { (field) -> CGFloat in
            return 40
        }
        keyboard.whc_SetKeyboradWillHide { (notification) in
            print("监听键盘将要隐藏")
        }
        
        keyboard.whc_SetKeyboradWillShow { (notification) in
            print("监听键盘将要显示")
        }
        
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
